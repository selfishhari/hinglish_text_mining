#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 23 21:36:57 2020

@author: Narahari B m
"""


from telethon import TelegramClient
from conf.local import credentials

# Remember to use your own values from my.telegram.org!
api_id = credentials.API_ID

api_hash = credentials.API_HASH

client = TelegramClient('anon', api_id, api_hash)

async def main():
    # Getting information about yourself
    me = await client.get_me()

    # "me" is an User object. You can pretty-print
    # any Telegram object with the "stringify" method:
    print(me.stringify())

    # When you print something, you see a representation of it.
    # You can access all attributes of Telegram objects with
    # the dot operator. For example, to get the username:
    username = me.username
    print(username)
    print(me.phone)

    # You can print all the dialogs/conversations that you are part of:
    async for dialog in client.iter_dialogs():
        print(dialog.name, 'has ID', dialog.id)

    # You can send messages to yourself...
    await client.send_message('me', 'Hello, myself!')
    # ...to some chat ID
    await client.send_message(-348266769, 'Hello, group!')
    # ...to your contacts
    await client.send_message('+34600123123', 'Hello, friend!')
    # ...or even to any username
    #await client.send_message('TelethonChat', 'Hello, Telethon!')

    # You can, of course, use markdown in your messages:
    message = await client.send_message(
        'me',
        'This message has **bold**, `code`, __italics__ and '
        'a [nice website](https://lonamiwebs.github.io)!',
        link_preview=False
    )

    # Sending a message returns the sent message object, which you can use
    print(message.raw_text)

    # You can reply to messages directly if you have a message object
    await message.reply('Cool!')

    # Or send files, songs, documents, albums...
    await client.send_file('me', '/home//home/fractaluser/Narahari/Personal/abc.png')

    # You can print the message history of any chat:
    async for message in client.iter_messages('me'):
        print(message.id, message.text)

        # You can download media from messages, too!
        # The method will return the path where the file was saved.
        if message.photo:
            path = await message.download_media()
            print('File saved to', path)  # printed after download is done

#async with client:
#    client.loop.run_until_complete(main())
async with client:
    me = await client.get_me()


async with client:
    messages = await client.get_messages('repairmymobile', limit = 5000)

message_id  = []

message = []

sender = []

reply_to = []

time = []

if len(messages):
    for chat in messages:
        message_id.append(chat.id)
        message.append(chat.message)
        sender.append(chat.from_id)
        reply_to.append(chat.reply_to_msg_id)
        time.append(chat.date)
        
data ={'message_id':message_id, 'message': message, 'sender_ID':sender, 'reply_to_msg_id':reply_to, 'time':time}
df = pd.DataFrame(data)


df.to_csv("data/01_raw/rmm_sample_5k_chats_23jan20.csv", index=False)