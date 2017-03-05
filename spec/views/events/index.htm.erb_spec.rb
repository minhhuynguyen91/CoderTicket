require 'rails_helper'

RSpec.describe "events/index.html.erb", type: :view do
  
  it 'display the upcoming event' do
    e1 = Event.new(:starts_at => 1.day.from_now, :name => 'Event 1')
    e2 = Event.new(:starts_at => 1.day.from_now, :name => 'Event 2')
    e1.save(:validate => false)
    e2.save(:validate => false)

    assign(:events, [e1, e2])

    user = FactoryGirl.create(:user)
    allow(view).to receive(:current_user) { user }

    render

    expect(rendered).to match /Event 1/
    expect(rendered).to match /Event 2/
  end

  it 'Display the search bar' do
    e1 = Event.new(:starts_at => 1.day.from_now, :name => 'Event 1')
    e2 = Event.new(:starts_at => 1.day.from_now, :name => 'Event 2')
    e1.save(:validate => false)
    e2.save(:validate => false)

    assign(:events, [e1, e2])

    user = FactoryGirl.create(:user)
    allow(view).to receive(:current_user) { user }

    render
    expect(rendered).to match /Search/
  end
end