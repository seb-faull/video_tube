class Video

	attr_accessor :id. :title, :body

	#Opens connection to database
	def self.open_connection
		PGconn.connect( dbname: "youtube_videos" )
	end


end