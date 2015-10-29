require 'rails_helper'

RSpec.describe "goals/new", type: :view do
  before(:each) do
    assign(:goal, Goal.new(
      :user => nil,
      :description => "MyText"
    ))
  end

  it "renders new goal form" do
    render

    assert_select "form[action=?][method=?]", goals_path, "post" do

      assert_select "input#goal_user_id[name=?]", "goal[user_id]"

      assert_select "textarea#goal_description[name=?]", "goal[description]"
    end
  end
end
