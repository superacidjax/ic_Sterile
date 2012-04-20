require 'spec_helper'

describe Counselor do

  it { should have_many :clients }
  it { should have_many :counseling_sessions }
  it { should have_many :days }
  it { should have_many :issues }
  it { should have_many :specialities }

  it { should validate_presence_of :phone_number }
  it { should validate_presence_of :skype_id }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :time_zone }

  describe "#session_booked_on?('2011-11-11 14:00:00')" do
    let(:counselor) { Fabricate(:counselor) }
    let(:start_time) { Time.now.beginning_of_day + 6.hours }
    subject { counselor.session_booked_on?(start_time) }
    context "when counselor has a booked session" do
      before { counselor.counseling_sessions.create(start_datetime: start_time, client: Fabricate(:client)) }
      it { should be_true }
    end
    context "when counselor has no booked session" do
      it { should be_false }
    end
  end

  context "when being updated" do
    subject { Fabricate(:counselor) }

    it { should validate_presence_of :birthday }
    it { should validate_presence_of :gender }

    context "and from the US" do
      before { subject.stub(:us?).and_return(true) }

      it { should validate_presence_of :employer_id_number }
    end
  end

  context "when licensed" do
    before { subject.stub(:licensed?).and_return(true) }

    it { should validate_presence_of :license_number }
    it { should validate_presence_of :licensing_authority }
  end

  context "if their license has been suspended" do
    before { subject.stub(:license_suspended?).and_return(true) }

    it { should validate_presence_of :license_suspension_authority }
    it { should validate_presence_of :license_suspension_date }
  end

  describe "#available_on?" do
    let(:counselor) { Fabricate(:unavailable_counselor) }
    before do
      counselor.days.create(day: "mon").update_attribute(:available_hours, [12, 1])
    end

    context "counselor with available slots on Monday" do
      it "should be available on Monday" do
        counselor.available_on?("mon").should be_true
      end

      it "should not be available on Tuesday" do
        counselor.available_on?("tue").should be_false
      end
    end
  end

  describe "hours list" do
    let(:counselor) { Fabricate(:unavailable_counselor) }

    it "should return the hours from the appropriate day" do
      counselor.days.create(day: "mon", available_hours: [9,10,11])
      counselor.hours_list("mon").should == [9,10,11]
    end

    it "should return no hours if none have been made available" do
      counselor.hours_list("mon").should == []
    end

    it "should return empty hours list for days that are nil" do
      counselor.hours_list(1.month.from_now).should == []

    end
  end

  describe "days" do
    let(:counselor) { Fabricate(:counselor) }

    it "should not be nil" do
      counselor.days.find_or_create_by_day("mon").should_not be_nil
    end
  end
end
