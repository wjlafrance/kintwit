class TweetsController < ApplicationController
  before_filter :authenticate

  def timeline
    begin
      @timeline = @user.api_client.home_timeline :page => current_page
      @timeline_pagination = make_pagination_collection(@timeline, current_page, 20, 800)
    rescue Twitter::Error::Unauthorized => unauthorized
      sign_out
      redirect_to root_path
    end
  end

  def mentions
    begin
      @timeline = @user.api_client.mentions :page => current_page
      @timeline_pagination = make_pagination_collection(@timeline, current_page, 20, 800)
    rescue Twitter::Error::Unauthorized => unauthorized
      sign_out
      redirect_to root_path
    end
  end

  def new
    if params[:tweet]
      current_user.api_client.update(params[:tweet])
      redirect_to root_path
    end
  end

private
  def current_page
    (params[:page] or 1).to_i
  end

  def make_pagination_collection(array, current_page, per_page, total_entries)
    WillPaginate::Collection.create(current_page, per_page, total_entries) do |pager|
      start = (current_page - 1) * per_page
      pager.replace(Array.new(start, nil) + array)
    end
  end
end
