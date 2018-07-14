require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))
    student_info = html.css('div.student-card')
    students = student_info.map do |s|
      {name: s.css('div.card-text-continer h4.student-name').text, 
      location: s.css('div.card-text-container p.student-location').text,
      profile_url: c.ss('a')['href']
      }
    end
    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
