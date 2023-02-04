
USE WhatsappDb 
GO
DROP TABLE whatsappMessage,whatsappUser,whatsappGroup

CREATE TABLE whatsappUser(
	userId INT UNIQUE IDENTITY(1,1) NOT NULL,  
  	phone BIGINT UNIQUE NOT NULL,
	userName VARCHAR(10) NOT NULL,
	about VARCHAR(50) NOT NULL,
	PRIMARY KEY(userId))

CREATE TABLE whatsappMessage(
	messageId INT UNIQUE IDENTITY(1,1) ,
	receiverId INT  NOT NULL, 
	senderId INT NOT NULL,
  	encryptedMessage VARCHAR(128), 
  	timeOpened TIME,
  	timeReceived TIME , 
	FOREIGN KEY (receiverId) REFERENCES whatsappUser (userId),
	FOREIGN KEY (senderId) REFERENCES whatsappUser (userId),
  	PRIMARY KEY(messageId));

CREATE TABLE whatsappGroup(
	groupId INT UNIQUE IDENTITY(1,1) ,
	groupName INT,
	groupAdmin INT NOT NULL,
	groupMessage INT,
	
	FOREIGN KEY (groupName) REFERENCES whatsappUser (userId),
	FOREIGN KEY (groupMessage)REFERENCES whatsappMessage (messageId),
	PRIMARY KEY (groupId));

INSERT INTO whatsappUser(phone,userName,about) 
VALUES		(09079219416,'Charles','Beyond bounds'),
			(08149977052,'Veritas','We are all born to die'),
			(09157075617,'Charlesmir','No man can save');

INSERT INTO whatsappMessage(senderId,receiverId,encryptedMessage,timeOpened,timeReceived)
VALUES	(3,1,'I am coming','2:00 pm','2:14 pm'),
		(2,3,'I am waiting','2:20 ','2:14 '),
		(1,3,'Be fast bro','3:00 pm','2:14 pm');

INSERT INTO whatsappGroup(groupId,groupAdmin,groupMessage)
VALUES (1,2,2),(2,1,3);




