SEED_PW = 'test1234'
SEED_URL = 'https://example.com'
SEED_TOPICS = %w{
  Science
  Chemistry
  Physics
  Computers
  Ecomm
  Cats
  Dogs
  Dance
  Gardening
  France
  Trees
}
SEED_FRIEND_COUNT = 3

puts "\nGenerating some Users and Members"
members = (1..20).map do |n|
  user = User.create(email: "email_#{n}@example.com", password: SEED_PW)
  print '.'
  Member.create(user: user, full_name: "Test User #{n}")
end

puts "\nGenerating some Websites and Passions for those Members"
members.each_with_index do |member, i|
  website = Website.create(member: member, full_url: "https://example.com/#{i}", short_url: "https://ex.com/#{i}")
  print '.'
  5.times do
    topic = SEED_TOPICS.sample(2).join(' and ')
    Passion.create(member: member, website: website, topic: topic)
    print '.'
  end
end

puts "\nGenerating some Friendships between those Members"
members.each do |member|
  (members - [member]).sample(SEED_FRIEND_COUNT).each do |friend|
    Friendship.find_by(from_member: friend, to_member: member) ||
    Friendship.create(from_member: member, to_member: friend)
    print '.'
  end
end

puts "\nDB seed complete!"
