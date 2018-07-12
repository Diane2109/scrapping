
require 'rubygems'
require 'nokogiri'
require 'open-uri'



def get_all_the_urls_of_val_doise_townhalls
  page_all_cities = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
  @links = page_all_cities.select{link}
  @links = page_all_cities.css("p a").map { |anchor| anchor["href"] }
  @links.pop
  @links.shift
  @links_new = []
  @links.each do |value|
    @links_new << value[1..-1]
  end
  @links_new
end

@hash_new = {}
def get_the_email_of_a_townhal_from_its_webpage(links)
  links.each do |value|
  page_one_city = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{value}"))
  puts ""
  @hash_new[page_one_city.css('small')[0].text] = page_one_city.css('td')[7].text
  puts ""
  puts ""
end
  puts @hash_new
end

def global_method
  get_all_the_urls_of_val_doise_townhalls
  get_the_email_of_a_townhal_from_its_webpage(@links_new)
end
global_method
