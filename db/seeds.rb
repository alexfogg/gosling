
Audio.delete_all
Image.delete_all
Message.delete_all
Ryan.delete_all
Video.delete_all


Message.create(:category => 'quirky', :message => 'Hey girl, Biostatics Ryan Gosling is going on an extended Christmanukkah break - Ryan Gosling')
Message.create(:category => 'cheeky', :message => 'hey girl, I would never break up with you while on vacation in Hawaii, just before a 6 hour flight. I would build us a house to live there forever. - Ryan Gosling')
Message.create(:category => 'cheeky', :message => 'hey girl, I would never have you cook me dinner have sex with you and then break up with you while still in bed. Can we just cuddle together? -Ryan Gosling')
Message.create(:category => 'cheeky', :message => 'hey girl, I would never dissapear from law school and send you a random letter saying I am in Argentina with a girlfriend, an apartment with a 2 year lease and two dogs. Can I meet your parents? -Ryan Gosling')

Message.create(:category => 'cheeky', :message => 'hey girl, I would never break up with you for not riding a mountain bike, how about you ride me tonight? -Ryan Gosling')

Message.create(:category => 'medieval', :message => 'Hey Girl. It took us three passes, but my lance is well and truly shattered. Well ridden. - Ryan Gosling')
Message.create(:category => 'medieval', :message => 'Hey Girl. Lets switch up the roleplay. You be the vikings- I will be Lindisfarne -Ryan Gosling')
Message.create(:category => 'medieval', :message => 'Hey Girl. I got us some takeout. Lets stay in and make fun of thehistorical inaccuracies in Kingdom of Heaven -Ryan Gosling')
Message.create(:category => 'polysci', :message => 'Hey Girl. Latest Senate Confirmation: I think ur cute. - Ryan Gosling')
Message.create(:category => 'polysci', :message => 'Hey Girl. I would consider violating national security if it meant I could spend my birthday with you -Ryan Gosling')

Message.create(:category => 'shakespeare', :message => 'hey girl. love sought is good, but given unsought is better')
Message.create(:category => 'shakespeare', :message => 'hey girl. lets go hand in hand, not one before another - Ryan Gosling')
Message.create(:category => 'shakespeare', :message => 'hey girl. love looks not with the eyes, but with the mind, and therefore is winged cupid painted blind -Ryan Gosling')
Message.create(:category => 'shakespeare', :message => 'hey girl, This is the very ecstasy of love... -Ryan Gosling')
Message.create(:category => 'silicon', :message => 'Hey girl. Unlike Amazon Web Services, I got 100% uptime - Ryan')
Message.create(:category => 'silicon', :message => 'Hey girl! I know you are stressed about launching your social media campaign. But dont you worry. I know it will be awe.sm -Ryan ')
Message.create(:category => 'silicon', :message => 'Hey girl. I know you hate waiting for your code to compile...but I thought of something we can do in the meantime -Ryan')


a = YoutubeSearch.search('Ryan Gosling').first(20)
videoidarray = a.map{|i| i['video_id']}
videotitle = a.map{|t| t['title']}
videoid = videoidarray.map!{|i| "http://youtube.com/embed/#{i}"}
j=0
a.each do |i|
  Video.create(:url => videoid[j], :name => videotitle[j])
  j+=1
end


Audio.create(:url => "https://s3.amazonaws.com/gosling/ryanromantic.mp3")
Audio.create(:url => "https://s3.amazonaws.com/gosling/whatdoyouwant.mp3")
Audio.create(:url => "https://s3.amazonaws.com/gosling/ryangoslingheygirl.mp3")
Audio.create(:url => "https://s3.amazonaws.com/gosling/RyanIntrospective.mp3")

Article.update_from_feed

