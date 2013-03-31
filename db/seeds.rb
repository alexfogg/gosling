a = YoutubeSearch.search('Ryan Gosling').first(20)
videoidarray = a.map{|i| i['video_id']}
videotitle = a.map{|t| t['title']}
videoid = videoidarray.map!{|i| "http://youtube.com/embed/#{i}"}
j=0
a.each do |i|
  Video.create(:url => videoid[j], :name => videotitle[j])
  j+=1
end