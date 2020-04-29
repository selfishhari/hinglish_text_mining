CREATE DATABASE rmm_telegram;

CREATE USER 'rmm_ai'@'localhost' IDENTIFIED BY 'rmm_ai';

GRANT ALL ON rmm_telegram.* TO 'rmm_ai'@'localhost';

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
phone varchar(15),
scam BOOL,
verified BOOL,
firstname VARCHAR(50),
lastname VARCHAR(50),
username VARCHAR(100),
is_bot BOOL
);

CREATE TABLE entity(
proc_msg_id INT,
message TEXT,
brand TEXT,
brand_count INT,
models TEXT,
models_count INT,
tools TEXT,
tools_count INT,
issues TEXT,
issues_group TEXT,
issues_count INT,
primary key(proc_msg_id)
);

CREATE TABLE entity_key(
proc_msg_id INT,
message_id INT
);

SHOW TABLES;

 /*ALTER TABLE messages ADD FOREIGN KEY (sender_id) REFERENCES users(user_id); */
 
 ALTER TABLE messages ADD PRIMARY KEY (message_id);
 
 ALTER TABLE entity_key ADD PRIMARY KEY (message_id);
 
 /*
 DELETE FROM messages WHERE message_id > 0;
 
 DELETE FROM users WHERE user_id > 95276708;
 */
 #DELETE FROM entity_key WHERE proc_msg_id >0;
 
# SET SQL_SAFE_UPDATES = 0;
 
 # For each database:
ALTER DATABASE rmm_telegram CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# For each table:
ALTER TABLE messages CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE entity CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# For each column:
ALTER TABLE messages CHANGE message message TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE entity CHANGE message message TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CHANGE firstname firstname VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CHANGE lastname lastname VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

ALTER TABLE users CHANGE username username VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

SHOW VARIABLES WHERE Variable_name LIKE 'character\_set\_%' OR Variable_name LIKE 'collation%';