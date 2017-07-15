require 'rails_helper'

RSpec.describe SponseredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }

  let(:my_sponsered_post) {
    my_topic.sponsered_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }

  describe "GET new" do
    it "returns https success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end
  end

#in the test below post is an inherited method, and we get the sponsered_post attribute from the add sponsered_post index for topic in schema.rb
  describe "SPONSREDPOST create" do
    it "increases the number of sponseredpost by 1" do
      expect {post :create, topic_id: my_topic.id, sponsered_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}}.to change(SponseredPost,:count).by(1)
    end
  end

  it "assigns the new sponsered_post to @sponsered_post" do
    post :create, topic_id: my_topic.id, sponsered_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}
    expect(assigns(:sponsered_post)).to eq SponseredPost.last
  end

  it "redirects to the new Post" do
    post :create, topic_id: my_topic.id, sponsered_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99}
    expect(response).to redirect_to [my_topic, SponseredPost.last]
  end

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsered_post.id
       expect(response).to render_template :show
    end

    it "renders the show view" do
      get :show, topic_id: my_topic.id, id: my_sponsered_post.id
      expect(response).to render_template :show
    end

    it "assigns my_sponsered_post to @sponsered_post" do
      get :show, topic_id: my_topic.id, id: my_sponsered_post.id
      expect(assigns(:sponsered_post)).to eq(my_sponsered_post)
    end
  end

  describe "Get edit" do
    it "returns http success" do
      get :edit, topic_id: my_sponsered_post.id, id: my_sponsered_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsered_post.id
      expect(response).to render_template :edit
    end

    it "assigns posts to be updated to @sponsered_post" do
      get :edit, topic_id: my_topic.id, id: my_sponsered_post.id

      post_instance = assigns(:sponsered_post)
      expect(post_instance.id).to eq my_sponsered_post.id
      expect(post_instance.title).to eq my_sponsered_post.title
      expect(post_instance.body).to eq my_sponsered_post.body
      expect(post_instance.price).to eq my_sponsered_post.price
    end
  end

  describe "PUT update" do
    it "updates post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = 80085

      put :update, topic_id: my_topic.id, id: my_sponsered_post.id, sponsered_post: {title: new_title, body: new_body, price: new_price}

      updated_post = assigns(:sponsered_post)
      expect(updated_post.id).to eq my_sponsered_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_post.body).to eq new_body
      expect(updated_post.price).to eq new_price
    end

    it "redirects to the updated post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, topic_id: my_topic.id, id: my_sponsered_post.id, sponsered_post: {title: new_title, body: new_body, price: 96}

      expect(response).to redirect_to [my_topic, my_sponsered_post]
    end
  end

  describe "DELETE destroy" do
    it "deletes the post" do
      delete :destroy, topic_id: my_topic.id, id: my_sponsered_post.id
      count = SponseredPost.where({id: my_sponsered_post.id}).size
      expect(count).to eq 0
    end

    it "redirects to topic show" do
      delete :destroy, topic_id: my_topic.id, id: my_sponsered_post.id
      expect(response).to redirect_to my_topic
    end
  end
end
