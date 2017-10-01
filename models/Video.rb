class Video

	attr_accessor :id. :title, :body

	#Opens connection to database
	def self.open_connection
		PGconn.connect( dbname: "youtube_videos" )
	end


	#Returns a new instance of the class; turns the strings in to hashes for controller
	def self.hydrate video_data
		video = Video.new

		video.id = video_data['id']
		video.title = video_data['title']
		video.description = video_data['description']
		video.url = video_data['url']
		video.genre = video_data['genre']

		video
	end



	#Index
	def self.all
		conn = self.open_connection
		sql = "SELECT * FROM video;"
		results = conn.exec(sql)

		videos = results.map do |record|
			self.hydrate(record)
		end

		videos
	end



	#Show / Find
	def self.find id
		conn = self.open_connection
		sql = "SELECT * FROM video WHERE id = #{id}"
		videos = conn.exec(sql)
		video = self.hydrate videos[0]

		video
	end










end