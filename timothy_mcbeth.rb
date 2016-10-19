require './nein_gag'
require './xkcd'
require './reddit'

class TimothyMcBeth

  def self.browse
    case Random.rand 3
    when 0
      NeinGag.top
    when 1
      Xkcd.random
    else
      Reddit.random
    end
  end

end
