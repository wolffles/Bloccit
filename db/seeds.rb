require 'random_data'

5.times do
  User.create!(
  name: RandomData.random_name,
  email: RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

 50.times do
   Post.create!(
    user: users.sample,
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
   )
 end

25.times do
  SponseredPost.create!(
  topic: topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  price: (1..100).to_a.sample
  )
end

 posts = Post.all
 sponsered_posts = SponseredPost.all

 100.times do
   Comment.create!(
     user: users.sample,
     post: posts.sample,
     body: RandomData.random_paragraph
   )
   Comment.create!(
   user: users.sample,
   sponsered_post: sponsered_posts.sample,
    body: RandomData.random_paragraph
   )
 end

 #create an admin user
 admin = User.create!(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
 )

 member = User.create!(
 name: 'Member User',
 email: 'member@example.com',
 password: 'helloworld'
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{SponseredPost.count} sponsored posts created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
