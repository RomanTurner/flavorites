
class SpruceScraper < Kimurai::Base
  @name= 'spruce_spider'
  @engine = :selenium_chrome
  @start_urls = ['https://www.thespruceeats.com/search?q=&searchType=recipe']
  
  @@recipe_links = []
  @@recipes = []

  def scrape_page
    counter = 1
    @@recipe_links.count.times do 
    browser.visit(@@recipe_links[counter - 1])
    doc = browser.current_response

    title = doc.css("h1.heading__title").text
    keywords = doc.css('#link-list_1-0').text.split("\n").reject(&:empty?)
    meta_prep_time = doc.css("#meta-text_2-0 > span.meta-text__data").text
    meta_cook_time = doc.css("#meta-text_3-0 > span.meta-text__data").text
    meta_total_time = doc.css("#meta-text_1-0 > span.meta-text__data").text
    meta_servings = doc.css("#meta-text_6-0 > span.meta-text__data").text
    meta_yield =  doc.css("#meta-text_5-0 > span.meta-text__data").text
    author = doc.css("#mntl-byline__link_1-0 > span").text
        
    title_image = doc.css('img').first['src']
    description = doc.css("#article__header--project_1-0 p").text.strip.gsub("\n",'')
    ingredient_list = doc.css("#section--ingredients_1-0 li").text.strip.split("\n").reject(&:empty?)
    instruction_list_paragraph  = doc.css("#section--instructions_1-0 p").map {|x| x.text.strip}.reject{|x| x == "Recipe Tags:"}
    instruction_list_photos = doc.css("#mntl-sc-block_3-0 img").map {|x| x.attr('data-src')}
    #Interweave on front end. paragraph then photo. Going to be an instruction component
    tips = doc.css("#mntl-sc-block-callout-body_1-0").text.strip.split("\n").reject(&:empty?)

    meta_data = {
        prep_time: meta_prep_time, 
        cook_time: meta_cook_time,
        total_time: meta_total_time,
        servings: meta_servings,
        meta_yield: meta_yield
    }
    
    Recipe.create(
      author:author,
      keywords: keywords,
      metadata:meta_data, 
      title: title, 
      main_img: title_image, 
      description:description,  
      ingriedients:ingredient_list,
      instructions:instruction_list_paragraph, 
      instruction_imgs:instruction_list_photos, 
      tips:tips, 
    )
    counter = counter + 1
    puts "🔺 🔺 🔺 🔺 🔺  ADDED RECIPE 🔺 🔺 🔺 🔺 "
    end
  end

  def get_links
    doc = browser.current_response
    a_tags = doc.css("li.results__item")
    a_tags.each do |tag|
    link = tag.css('a')[0].attributes['href'].value
    @@recipe_links << link
    end
    puts "🔹 🔹 🔹 CURRENT NUMBER OF RECIPES: #{@@recipe_links.count}🔹 🔹 🔹" 
    puts "🌟  🌟  🌟  CURRENT URL: #{browser.current_url}🌟  🌟  🌟" 
  end

   def parse(response, url:, data: {})
    # scrape first page
    get_links
    # visit next page and scrape it
    
    40.times do  
      if browser.current_url.match(/search?/) 
      browser.find('//*[@id="pagination"]/ul/li[7]/button').click
      get_links
      else 
      browser.go_back
      browser.refresh
      end 
    end 

    scrape_page

    # Option to write data as a json file
    #    File.open("recipes.json","w") do |f|
    #         f.write(JSON.pretty_generate(@@recipes))
    #end
    puts "🟢  🟢  🟢 CURRENT NUMBER OF RECIPES: #{@@recipe_links.count}🟢  🟢  🟢 "
  end

end