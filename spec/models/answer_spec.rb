require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:clue) {Question.new(title: "wolfie's death", body:"who what when where why", resolved: false) }
  let(:answer) {Answer.new(question: clue, body: "It was brittany in the kitchen with a chainsaw") }

  it "responds to body" do
    expect(answer).to respond_to(:body)
  end
end
