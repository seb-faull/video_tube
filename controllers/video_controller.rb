class VideosController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views') }


	#Index
	get "/videos" do
		@page_header = "All videos"
		@videos = Video.all
		erb :"videos/index"
	end



	#Create
	post "/videos" do
		new_video = Video.new
		new_video.title = params[:title]
		new_video.description = params[:description]
		new_video.url = params[:url]
		new_video.genre = params[:genre]
		new_video.save

		redirect "/videos"
	end


















end