require 'random_data'

15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

 50.times do
   Post.create!(
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

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{SponseredPost.count} sponsored posts created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
