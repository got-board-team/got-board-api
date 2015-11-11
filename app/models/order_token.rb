class OrderToken < ActiveRecord::Base
  include RailsSTIModel

  pusherable :order_token

  belongs_to :board
  belongs_to :player

  attr_accessor :territory_id

  scope :by_territory, -> (slug) { where(territory: slug) }
  scope :without_territory, -> { where(territory: nil) }

  def territory_id=(territory_slug)
    self.territory = territory_slug
  end

  def self.bulk_update(ids, attrs)
    orders = where(id: ids)
    orders.update_all(attrs)
    orders.reload
    Pusher.trigger('order_token', 'order_token.bulk_update', orders)
  end
end
