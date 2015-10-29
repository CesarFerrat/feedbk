require 'rails_helper'

RSpec.describe "feedbacks/new", type: :view do
  before(:each) do
    assign(:feedback, Feedback.new(
      :user => nil,
      :rate => 1,
      :comment => "MyText",
      :goal => nil,
      :user => nil
    ))
  end

  it "renders new feedback form" do
    render

    assert_select "form[action=?][method=?]", feedbacks_path, "post" do

      assert_select "input#feedback_user_id[name=?]", "feedback[user_id]"

      assert_select "input#feedback_rate[name=?]", "feedback[rate]"

      assert_select "textarea#feedback_comment[name=?]", "feedback[comment]"

      assert_select "input#feedback_goal_id[name=?]", "feedback[goal_id]"

      assert_select "input#feedback_user_id[name=?]", "feedback[user_id]"
    end
  end
end
