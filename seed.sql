DROP TABLE IF EXISTS video;

	CREATE TABLE video (
		id SERIAL PRIMARY KEY,
		title VARCHAR,
		description VARCHAR,
		url VARCHAR,
		genre TEXT

);


INSERT INTO video (title, description, url, genre) VALUES ('Ruby Rails Tutorial', 'This tutorial covers installation, MVC, setting up MySQL, the file system, creating controllers and views, embedded Ruby, Routes, communication between the controller and views, migrations and more.', '<iframe width="560" height="315" src="https://www.youtube.com/embed/GY7Ps8fqGdc" frameborder="0" allowfullscreen></iframe>', 'Education');
