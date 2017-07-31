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

 150.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
   Comment.create!(
  sponsered_post: sponsered_posts.sample,
    body: RandomData.random_paragraph
   )
 end

 user = User.first
 user.update_attributes!(
  email: "wolfie.truong@gmail.com",
  password: 'helloworld'
 )

 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Topic.count} topics created"
 puts "#{SponseredPost.count} sponsored posts created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
