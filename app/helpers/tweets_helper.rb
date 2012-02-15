module TweetsHelper

  def navigation_bar
    return "<span class=\"pages\">#{link_to "Log In", login_path}</span>" unless @user

    case params["action"]
      when "timeline"
        return "<span class=\"current_page\">Timeline</span> | <span class=\"pages\">" +
          "#{link_to "Mentions", mentions_path} | " +
          "#{link_to "New Tweet", new_tweet_path} | " +
          "#{link_to "Log Out", logout_path}</span>"
      when "mentions"
        return "<span class=\"current_page\">Mentions</span> | <span class=\"pages\">" +
          "#{link_to "Timeline", timeline_path} | " +
          "#{link_to "New Tweet", new_tweet_path} | " +
          "#{link_to "Log Out", logout_path}</span>"
      when "new"
        return "<span class=\"current_page\">New Tweet</span> | <span class=\"pages\">" +
          "#{link_to "Timeline", timeline_path} | " +
          "#{link_to "Mentions", mentions_path} | " +
          "#{link_to "Log Out", logout_path}</span>"
      else
        return "Error: Unknown action"
    end
  end

  def tweet_row(tweet)
    '<tr>' +
    "<td class=\"tweet_image\">#{profile_image_for tweet}" +
    "<td class=\"tweet_text\">" +
      "#{name_for tweet}<br>" +
      "#{text_for tweet}<br>" +
      "#{timestamp_for tweet}"
  end

  def name_for(tweet)
    unless tweet.retweeted_status
      "<b>@#{tweet.user.screen_name}</b> (#{tweet.user.name})"
    else
      "<b>@#{tweet.retweeted_status.user.screen_name}</b> (#{tweet.retweeted_status.user.name})"
    end
  end
  
  def timestamp_for(tweet)
    unless tweet.retweeted_status
      "<span class=\"timestamp\">#{time_ago_in_words(tweet.created_at)} ago</span>"
    else
      "<span class=\"timestamp\">#{time_ago_in_words(tweet.created_at)} ago</span><br>" +
      "<span class=\"timestamp\">retweeted #{time_ago_in_words(tweet.retweeted_status.created_at)} " +
      "ago by <b>@#{tweet.user.screen_name}</b> (#{tweet.user.name})</span>"
    end
  end
  
  def profile_image_for(tweet)
    unless tweet.retweeted_status
      image_tag tweet.user.profile_image_url, :alt => "Profile image", :size => "100x100"
    else
      image_tag tweet.retweeted_status.user.profile_image_url, :alt => "Profile image", :size => "100x100"
    end
  end
  
  def text_for(tweet)
    unless tweet.retweeted_status
      tweet.text
    else
      tweet.retweeted_status.text
    end
  end
  
end
