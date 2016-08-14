term = %w(Fall2014 Summer2014 Spring2014 Fall2015 Summer2015 Spring2015 )

0.upto(49) do |idx|
  Post.create(
    term: term[idx % 6],
    campus: 0,
    title: "CS 590 Algorithm",
    body: "nothing",
    rate: 3,
    member_id: 2
  )
end
