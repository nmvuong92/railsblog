require 'rails_helper'

RSpec.describe "widgets/new", type: :view do
  before(:each) do
    assign(:widget, Widget.new(
      name: "MyString"
    ))
  end

  it "renders new widget form" do
    render

    assert_select "form[action=?][method=?]", widgets_path, "post" do

      assert_select "input[name=?]", "widget[name]"
    end
  end
end
