USE rmm_telegram;

CREATE TABLE messages(
message_id INT,
message TEXT,
sender_id INT,
reply_to_msg_id INT,
time TIMESTAMP,
primary key(message_id)
);

CREATE TABLE users(
user_id INT,
phone INT,
scam BOOL,
verified BOOL,
firstname VARCHAR(50),
lastname VARCHAR(50),
username VARCHAR(100),
is_bot BOOL,
primary key(sender_id)
);

 /*ALTER TABLE messages ADD FOREIGN KEY (sender_id) REFERENCES users(user_id); */
 
 ALTER TABLE messages ADD PRIMARY KEY (message_id);
 
 ALTER TABLE users
 MODIFY COLUMN phone varchar(15);
 
 /*ALTER TABLE messages
 MODIFY COLUMN time TIMESTAMP;
 
 DROP TABLE messages;
 
 */
 
 ALTER TABLE users
 DROP status;
 
 SELECT * FROM messages;
 
 SELECT count(*) FROM messages;
 /*
 DELETE FROM messages WHERE message_id > 0;
 
 DELETE FROM users WHERE user_id > 95276708;
 */
 DELETE FROM users WHERE user_id > 0;
 
 # For each database:
ALTER DATABASE rmm_telegram CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
# For each table:
ALTER TABLE messages CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# For each column:
ALTER TABLE messages CHANGE message message TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CHANGE firstname firstname VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CHANGE lastname lastname VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CHANGE username username VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SHOW VARIABLES WHERE Variable_name LIKE 'character\_set\_%' OR Variable_name LIKE 'collation%';