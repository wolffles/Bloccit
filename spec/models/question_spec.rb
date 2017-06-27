require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:ask_question) {Question.new(title: "go fish", body: "got any 4s?", resolved: false) }
  it "responds to title" do
    expect(ask_question).to respond_to(:title)
  end

  it "responds to body" do
    expect(ask_question).to respond_to(:body)
  end

  it "responds to resolved" do
    expect(ask_question).to respond_to(:resolved)
  end
end
