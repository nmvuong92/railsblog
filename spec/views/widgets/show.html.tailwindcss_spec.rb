require 'rails_helper'

RSpec.describe "widgets/show", type: :view do
  before(:each) do
    assign(:widget, Widget.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
