require_relative './spruce_scraper.rb'
desc '🌲 Grabs Recipes from Spruce Eats🕷'
task :spruce_spider  => :environment do
    SpruceScraper.crawl!
end