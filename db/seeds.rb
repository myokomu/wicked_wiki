lrm = Faker::Lorem
10.times do 
  wiki = WickedWiki::Wiki.create(title: lrm.word, content: lrm.sentence(100), ip: "127.0.0.1", protection: "no protection")
  WickedWiki::Revision.create(content: lrm.sentence(100), wiki: wiki, ip: "127.0.0.1")
end
