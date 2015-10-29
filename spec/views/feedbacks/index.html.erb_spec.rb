require 'rails_helper'

RSpec.describe "feedbacks/index", type: :view do
  before(:each) do
    assign(:feedbacks, [
      Feedback.create!(
        :user => nil,
        :rate => 1,
        :comment => "MyText",
        :goal => nil,
        :user => nil
      ),
      Feedback.create!(
        :user => nil,
        :rate => 1,
        :comment => "MyText",
        :goal => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of feedbacks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
