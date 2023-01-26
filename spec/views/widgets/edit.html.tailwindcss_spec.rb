require 'rails_helper'

RSpec.describe "widgets/edit", type: :view do
  let(:widget) {
    Widget.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:widget, widget)
  end

  it "renders the edit widget form" do
    render

    assert_select "form[action=?][method=?]", widget_path(widget), "post" do

      assert_select "input[name=?]", "widget[name]"
    end
  end
end
