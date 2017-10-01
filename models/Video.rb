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



	#Create & Update
	def save
		conn = Video.open_connection

		if (!self.id)
			sql = "INSERT INTO video (title, description, url, genre) VALUES ( '#{self.title}', '#{self.description}', '#{self.url}', '#{self.genre}')"
		else
			sql = "UPDATE video SET title = '#{self.title}', description = '#{self.description}', url = '#{self.url}', genre = '#{self.genre}' WHERE id = #{self.id}"
		end

		conn.exec(sql)
	end



	#Delete
	def self.destoy id
		conn = Video.open_connection

		sql = "DELETE FROM video WHERE id = #{id}"
		conn.exec(sql)
	end










end