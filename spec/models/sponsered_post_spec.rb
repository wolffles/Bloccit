require 'rails_helper'

RSpec.describe SponseredPost, type: :model do
  let(:foo) { RandomData.random_sentence }
  let(:bar) {
    RandomData.random_paragraph }
  let(:baz) { RandomData.random_sentence }
  let(:blah) { RandomData.random_paragraph }
  let(:topic) { Topic.create!( name: foo, description: bar ) }
  let(:post_var ) { topic.posts.create!(title: baz, body: blah) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(post_var).to have_attributes(title: baz, body: blah)
    end
  end
end
