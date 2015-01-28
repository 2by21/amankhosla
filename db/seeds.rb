if !Link.all.count == 4
  Link.create(url: 'http://www.example.com')
  Link.create(url: 'http://www.example.com')
  Link.create(url: 'http://www.example.com')
  Link.create(url: 'http://www.example.com')
end

Bio.create(text: "empty")