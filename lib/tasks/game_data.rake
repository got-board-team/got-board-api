require 'yaml'
require 'nokogiri'

namespace :game_data do
  task update_territories_paths: :environment do
    yml_file = 'config/game_data/map_areas.yml'
    territories = YAML::load_file(yml_file)
    original = File.read('app/assets/images/board.svg')
    svg = Nokogiri::XML.parse(original)
    errors = []

    territories['map_areas'].each_with_index do |territory, index|
      slug = territory['slug'].gsub(/_/, '-').gsub("port-of", "port")
      path = svg.at_css("##{slug} path")
      path = svg.at_css("##{slug}") if path.nil?
      if path.nil?
        errors << slug
        next
      end
      territory['id'] = index + 1
      territory['path'] = path['d']
    end

    ap territories

    puts "Not Found paths: #{errors.join(", ")}" if errors.present?
    puts "Are you sure you want to save that ? [y/n] (Taca-lhe pau nesse carrinho Marcus ?)"
    input = STDIN.gets.chomp

    if input.downcase == "y"
      puts "Saving territories paths..."
      File.open(yml_file, 'w') {|f| f.write territories.to_yaml }
      puts "DONE!"
    else
      puts "ABORTED!"
    end
  end

end
