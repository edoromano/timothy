require './webpage'
require 'nokogiri'

class Xkcd

  URL = 'http://c.xkcd.com/random/comic/'

  def self.random
    w = WebPage.new URL
    doc = Nokogiri::HTML w.raw
    title = doc.xpath('//div[@id="ctitle"]').text
    url = w.raw.match(/Permanent link to this comic: (http:\/\/xkcd.com\/[0-9]+\/)/)[1]
    return "#{title}\n#{url}"
  end

end
