module TweetsHelper

  def profile_image_for(tweet)
    image_tag tweet.user.profile_image_url, :alt => "Profile image", :size => "100x100"
  end

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
      "<b>@#{tweet.user.screen_name}</b> (#{tweet.user.name})<br>" +
      "#{tweet.text}<br>" +
      "<span class=\"timestamp\">#{time_ago_in_words(tweet.created_at)} ago</span>"
  end

end
