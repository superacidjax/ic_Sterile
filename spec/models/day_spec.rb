require 'spec_helper'

describe Day do
  let(:counselor) { Fabricate(:unavailable_counselor) }
  it "should aggregate the available hours" do
    counselor.days.create(day: "mon", hours: {hour_9: "1", hour_10: "1", hour_11: "0"})
    counselor.hours_list("mon").should == [9,10]
  end
end
