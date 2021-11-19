DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;
CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  email varchar(30) NOT NULL,
  password varchar(8) NOT NULL,
  username varchar(20) NOT NULL,
  birthday date NOT NULL,
  sex varchar(20) NOT NULL,
  country varchar(30) NOT NULL,
  postcode int NOT NULL
);
CREATE TABLE videos (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(150) NOT NULL,
  description varchar(300) NOT NULL,
  size float NOT NULL,
  thumbnail blob NOT NULL,
  times_played int NOT NULL,
  scope enum('public', 'hidden', 'private'),
  user_id int NOT NULL,
  date_time timestamp NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE channels(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  channel_name varchar(30) NOT NULL,
  description varchar(300) NOT NULL,
  creation_date date NOT NULL,
  user_id int NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE playlists(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  playlist_name varchar(30) NOT NULL,
  creation_date date NOT NULL,
  scope enum('private', 'public') NOT NULL,
  user_id int NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id)
);
CREATE TABLE tags(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  tag_name varchar(30) NOT NULL,
  video_id int NOT NULL,
  FOREIGN KEY(video_id) REFERENCES videos(id)
);
CREATE TABLE comments(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  text varchar(300) NOT NULL,
  date_time timestamp NOT NULL,
  user_id int NOT NULL,
  video_id int NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(video_id) REFERENCES videos(id)
);
CREATE TABLE video_reactions(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  reaction enum('like', 'dislike'),
  user_id int NOT NULL,
  video_id int NOT NULL,
  date_time timestamp NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(video_id) REFERENCES videos(id)
);
CREATE TABLE comment_reactions(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  reaction enum('like', 'dislike'),
  user_id int NOT NULL,
  comment_id int NOT NULL,
  date_time timestamp NOT NULL,
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(comment_id) REFERENCES comments(id)
);