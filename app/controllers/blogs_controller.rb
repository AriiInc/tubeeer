class BlogsController < ApplicationController
	# require 'blog.rb'#先ほど上で準備したファイルを呼ぶ

	# include Applicatio/nHelper

  def new
      #空のモデルをビューへ渡す
  	  @blog = Blog.new
  end


  def create
      #ストロングパラメータを使う
	 blog = Blog.new(blog_params)
     blog.user_id = 1
     blog.category = 'a'
     if blog.save
     #DBへ保存する
     redirect_to blogs_path
 	else
     #トップ画面へリダイレクト
     redirect_to new_blog_path
 	end
  end

  def index
  	 # @blogs = Blog.all
     @blogs = Blog.page(params[:page])
  	 @youtube = get_data('野球')
     @blogs_pg = Blog.page(params[:page]).per(5).order(:id)
  end

  def show
     @blog = Blog.find(params[:id])
  end

  def edit
     @blog = Blog.find(params[:id])
  end

  def update
      blog = Blog.find(params[:id])
      blog.update(blog_params)
      redirect_to blog_path(blog.id)
  end

  def destroy
      blog = Blog.find(params[:id])
      blog.destroy
      redirect_to blogs_path
  end

  


	 #  def main
	 #  opts = Trollop::options do
	 #    opt :q, 'Search term', :type => String, :default => '野球' #defaoultの内容を検索したいワードにする。
	 #    opt :max_results, 'Max results', :type => :int, :default => 25 #検索結果数を決める（最大50まで）
	 #    opt :order, 'order', :type => String, :default => 'viewCount' #視聴回数の多い順にデータを取得する。
	 #  end

	 #  client, youtube = get_service

	 #  begin

	 #    search_response = client.execute!(
	 #      :api_method => youtube.search.list,
	 #      :parameters => {
	 #        :part => 'snippet',
	 #        :q => opts[:q],#上記の検索ワードを変換する
	 #        :maxResults => opts[:max_results]#上記の取得数を変換する
	 #        :order => opts[:order],#上記の取得順を変換する
	 #      }
	 #    )
	 #  puts search_response

	 #  rescue Google::APIClient::TransmissionError => e
	 #    puts e.result.body
	 #  end
  # end

  def get_data(keyword)
  require 'blog.rb'
  opts = Trollop::options do
    opt :q, 'Search term', :type => String, :default => keyword
    opt :max_results, 'Max results', :type => :int, :default => 50
    opt :order, 'order', :type => String, :default => 'date'
    opt :regionCode, 'region', :type => String, :default => 'JP'
  end

  # client, youtube = get_service

  begin

    # search_response = client.execute!(
    #   :api_method => youtube.search.list,
    #   :parameters => {
    #     :part => 'snippet',
    #     :q => opts[:q],
    #     :maxResults => opts[:max_results],
    #     :order => opts[:order],
    #     :regionCode => opts[:regionCode]
    #   }
    # )

  # @movies = search_response.data.items#Jsonの中身が多かったので必要な情報のみ受けれるようにしています。

  # rescue Google::APIClient::TransmissionError => e
    # puts e.result.body
  end
end

  private

  def blog_params
  	  params.require(:blog).permit(:title, :body, :image)
  end




end
