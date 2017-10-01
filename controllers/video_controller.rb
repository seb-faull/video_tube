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



	#Show
	get "/videos/:id" do
		id = params[:id].to_i
		@video = Video.find(id)
		erb :"videos/show"
	end



	#Edit
	get "/videos/:id/edit" do
		@video = Video.find(params[:id])
		erb :"videos/edit"
	end



	#Update
	put "/videos/:id" do
		video = Video.find(params[:id])
		video.title = params[:title]
		video.description = params[:description]
		video.url = params[:url]
		video.genre = params[:genre]
	end










end