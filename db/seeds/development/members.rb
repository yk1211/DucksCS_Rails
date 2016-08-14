names = ["Harry", "James", "Jing", "Gary", "Wu", "Kobayashi", "Ho", "Tang", "Mary", "Rahman"]
0.upto(9) do |idx|
  Member.create(
    name: names[idx],
    email: "#{names[idx]}@stevens.edu",
    password: "password",
    password_confirmation: "password"
  )
end
