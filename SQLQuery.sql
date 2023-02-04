select * from whatsappGroup
SELECT        whatsappUser.phone, whatsappMessage.senderId,whatsappMessage.receiverId,whatsappUser.username,whatsappMessage.encryptedMessage
FROM            whatsappMessage  JOIN
                         whatsappUser ON whatsappMessage.receiverId = whatsappUser.userId 
SELECT *
FROM [whatsappMessage]
WHERE receiverId = (SELECT userId FROM [whatsappUser] WHERE userId = [whatsappMessage].receiverId)