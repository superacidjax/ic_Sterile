require 'spec_helper'

describe CounselingSession do

  it { should belong_to :counselor }
  it { should belong_to :client }

  describe "start_datetime=" do
    let(:start_time) { (Time.now.beginning_of_day + 5.hours).utc }
    let(:end_time) { (start_time + Counselor::DEFAULT_COUNSELING_SESSION_MINUTES.minutes).utc }
    let(:counseling_session) do
      Fabricate(:counseling_session,
                client: Fabricate(:client),
                counselor: Fabricate(:counselor),
                start_datetime: start_time)
    end
    subject { counseling_session.end_datetime.strftime("%Y-%m-%d %H:%M:%S %Z") }

    it "sets the end datetime to the start datetime plus the pre-configured time per counseling_session" do
      should == end_time.to_s
    end
  end

end
