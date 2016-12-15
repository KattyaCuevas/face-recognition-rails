require 'face'
client = Face.get_client(api_key: 'ea79e06c9c154896b7fcd443485a9b85', api_secret: '410acf4112af410e9f2106319e501427')
image_urls = [
  'https://skybiometry.com/wp-content/uploads/2015/09/eva-2ppl-web-1-e1451908961635.jpg',
  'https://skybiometry.com/wp-content/uploads/2016/01/recognition-2nd-e1451908699204.jpg',
  'https://skybiometry.com/wp-content/uploads/2015/09/face-recognition-negative-1-e1451909042742.jpg',
  'https://skybiometry.com/wp-content/uploads/2015/09/eva-3ppl-web-1-e1451909054787.jpg'
]
faces = client.faces_detect(urls: [image_urls[0]])
juan = faces['photos'][0]['tags'][0]
mary = faces['photos'][0]['tags'][1]
juan_tag = client.tags_add(url: image_urls[0], x: juan['center']['x'], y: juan['center']['y'], width: juan['width'], height: juan['height'], uid: 'juan@other')
mary_tag = client.tags_add(url: image_urls[0], x: mary['center']['x'], y: mary['center']['y'], width: mary['width'], height: mary['height'], uid: 'mary@other')
client.tags_save(uid: 'juan@other', tids: [juan['tid']])
client.tags_save(uid: 'mary@other', tids: [mary['tid']])
client.faces_train(uids: ['juan@other', 'mary@other'])

faces = client.faces_detect(urls: [image_urls[1]])
july = faces['photos'][0]['tags'][0]
aurora = faces['photos'][0]['tags'][1]
july_tag = client.tags_add(url: image_urls[1], x: july['center']['x'], y: july['center']['y'], width: july['width'], height: july['height'], uid: 'july@other')
aurora_tag = client.tags_add(url: image_urls[1], x: aurora['center']['x'], y: aurora['center']['y'], width: aurora['width'], height: aurora['height'], uid: 'aurora@other')
client.tags_save(uid: 'july@other', tids: [july['tid']])
client.tags_save(uid: 'aurora@other', tids: [aurora['tid']])
client.faces_train(uids: ['july@other', 'aurora@other'])

faces = client.faces_detect(urls: [image_urls[2]])
linda = faces['photos'][0]['tags'][0]
linda_tag = client.tags_add(url: image_urls[2], x: linda['center']['x'], y: linda['center']['y'], width: linda['width'], height: linda['height'], uid: 'linda@other')
client.tags_save(uid: 'linda@other', tids: [linda['tid']])
client.faces_train(uids: ['linda@other'])

faces = client.faces_detect(urls: [image_urls[3]])
linda = faces['photos'][0]['tags'][0]
jorge = faces['photos'][0]['tags'][1]
ariana = faces['photos'][0]['tags'][2]
linda_tag = client.tags_add(url: image_urls[3], x: linda['center']['x'], y: linda['center']['y'], width: linda['width'], height: linda['height'], uid: 'linda@other')
jorge_tag = client.tags_add(url: image_urls[3], x: jorge['center']['x'], y: jorge['center']['y'], width: jorge['width'], height: jorge['height'], uid: 'jorge@other')
ariana_tag = client.tags_add(url: image_urls[3], x: ariana['center']['x'], y: ariana['center']['y'], width: ariana['width'], height: ariana['height'], uid: 'ariana@other')
client.tags_save(uid: 'linda@other', tids: [linda['tid']])
client.tags_save(uid: 'jorge@other', tids: [jorge['tid']])
client.tags_save(uid: 'ariana@other', tids: [ariana['tid']])
client.faces_train(uids: ['linda@other', 'jorge@other', 'ariana@other'])
