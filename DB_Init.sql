CREATE TABLE person (
	username VARCHAR(30) PRIMARY KEY,
	firstName VARCHAR(30),
	lastName VARCHAR(30),
	password VARCHAR(30),
);

CREATE TABLE bug (
	id INT IDENTITY(1,1) PRIMARY KEY,
	createDate DATE,
	shortDescription VARCHAR(300),
	longDescription VARCHAR(3000),
	person VARCHAR(30),
	status VARCHAR(30),
	urgency VARCHAR(30),
	cruciality VARCHAR(30),

	CONSTRAINT FK_error_person FOREIGN KEY (person)
        REFERENCES person (username)
);

CREATE TABLE bug_history (
	id INT IDENTITY(1,1) PRIMARY KEY,
	bug INT,
	action VARCHAR(30),
	actionDate DATE,
	person VARCHAR(30),
	comment VARCHAR(300),

	CONSTRAINT FK_bh_bug FOREIGN KEY (bug)
        REFERENCES bug (id),
	CONSTRAINT FK_bh_person FOREIGN KEY (person)
        REFERENCES person (username)
);

INSERT INTO person(username, password, firstName, lastName)
VALUES  ('user1','user1','First ', 'User'),
		('user2','user2','Second ', 'User'),
		('user3','user3','Thinrd ', 'User');