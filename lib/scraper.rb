require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))
    student_info = html.css('div.student-card div.card-text-container')
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
