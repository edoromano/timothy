require './webpage'
require 'nokogiri'

class Reddit

  URL = 'https://www.reddit.com/'

  def self.random
    w = WebPage.new URL
    doc = Nokogiri::HTML w.raw
    a = doc.xpath '//a[@class="title may-blank outbound "]'
    url = ''
    while url[0..3] != 'http' do
      i = Random.rand a.length
      title = a[i].text
      url = a[i]['href']
    end
    return "#{title}\n#{url}"
  end

end
