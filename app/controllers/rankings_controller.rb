class RankingsController < ApplicationController
  def show
  end

  def index
  	@blogs = Blog.all
   # get_data("キーワード")
  end

  # def get_data(keyword)
  #   require 'google/apis/youtube_v3'
  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #   youtube.key = 'AIzaSyDsho9meDxXiw2bQxgYfQD8X4jBRtlmVMQ'

  #  search_response = youtube.list_channels
  #  @videos = search_response.items
  # end
end
