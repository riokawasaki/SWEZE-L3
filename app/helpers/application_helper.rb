module ApplicationHelper
  def time_ago_in_minutes(datetime)
    return "不明" if datetime.nil?

    minutes_ago = ((Time.current - datetime) / 60).to_i
    case minutes_ago
    when 0 then "たった今"
    when 1 then "#{minutes_ago} 分前"
    else "#{minutes_ago} 分前"
    end
  end
end