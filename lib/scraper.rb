require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))
    student_info = html.css('div.student-card')
    student_info.map do |s|
      {name: s.css('div.card-text-container h4.student-name').text,
      location: s.css('div.card-text-container p.student-location').text,
      profile_url: s.css('a')[0]['href']
      }
    end
  end

  def self.scrape_profile_page(profile_url)
    html = Nokogiri::HTML(open(profile_url))
    social_media = html.css('div.social-icon-container a').map do |a|
      ref = a['href']
      {self.url_type(ref).to_sym => ref}
    end
    bio = html.css('div.bio-block.details-block div.description-holder p').text
    quote = html.css('div.vitals-text-container div.profile-quote').text
    binding.pry
  end

  def self.url_type(url)
    beginning = url.split(".com")[0]
    domain = beginning.split("//").last
    domain.split(".").last
  end

end
