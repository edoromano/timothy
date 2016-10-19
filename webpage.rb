require 'open-uri'
require 'open_uri_redirections'

class WebPage

  REFRESH_AFTER = 60
  USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36'

  def initialize(url)
    @url = URI::parse url
    @raw = nil
  end

  def raw
    tmp = "/tmp/#{@url.hostname}#{@url.path.gsub(/\//, '_')}"
    begin
      if File.mtime(tmp) + REFRESH_AFTER > Time.now
        return @raw if @raw != nil
        @raw = File.read tmp
        return @raw
      end
    rescue
    end
    begin
      doc = open @url, :allow_redirections => :all,
                      'User-Agent' => USER_AGENT
    rescue => exc
      raise "Could not get #{@url}: #{exc.message}"
    end
    @raw = doc.read
    File.write tmp, @raw
    return @raw
  end

end
