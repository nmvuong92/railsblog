require 'rails_helper'

RSpec.describe "widgets/index", type: :view do
  before(:each) do
    assign(:widgets, [
      Widget.create!(
        name: "Name"
      ),
      Widget.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of widgets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
