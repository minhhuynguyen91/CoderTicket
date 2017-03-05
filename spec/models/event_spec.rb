require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '.publish_event' do
    it "return pusblish is true when use" do
      event = Event.new(:publish => false)
      event.save(:validates => false)

      event.publish_event
      expect(event.publish).to eq(true)
    end
  end
  describe '#upcoming' do
    it "return [] if there is no upcoming event" do
      e1 = Event.new(:starts_at => 1.day.ago)
      e1.save(:validates => false)

      expect(Event.upcoming).to eq []
    end
  end
end
