module RailsSTIModel
  extend ActiveSupport::Concern
  # The following two methods add the "type" parameter to the to_json output.
  # see also:
  # http://stackoverflow.com/questions/8945846/including-type-attribute-in-json-respond-with-rails-3-1/15293715#15293715
  def as_json(options={})
    super(options).merge(type: self.class.name)
  end

end
