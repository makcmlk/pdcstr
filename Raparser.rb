module Raparser
require 'open-uri'
require 'nokogiri'

def self.get_new
  get_shows(0)[0]
end

def self.get_shows (needed_count)
  site_url = 'https://www.residentadvisor.net'
  list_url = '/podcast.aspx'
  shows_collected = []
  raw_list = Nokogiri::HTML(open(site_url + list_url))
  raw_list.css('.standard')[0..needed_count].each do |show|
    article_title = show.css('a')[2].text.strip
    article_url = show.css('a')[2]['href']
    podcast_doc = Nokogiri::HTML(open(site_url + article_url))
    download_url = podcast_doc.xpath('//*[@id="downloads"]/li[1]/a')[0][:href]
    shows_collected.push(title: article_title, link: download_url)
  end
  shows_collected
end
end
