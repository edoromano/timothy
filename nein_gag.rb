require './webpage.rb'
require 'nokogiri'

class NeinGag

  URL = 'http://www.9gag.com/'

  def self.top
    w = WebPage.new URL
    doc = Nokogiri::HTML w.raw
    posts = doc.xpath('//a[@class="badge-evt point"]').map do |a|
      { url: "http://www.9gag.com#{a['href']}",
        points: a.first_element_child.text.sub(/,/, '').to_i }
    end
    posts.sort! { |x,y| y[:points] - x[:points] }
    return posts.first[:url]
  end

end
