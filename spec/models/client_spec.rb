require 'spec_helper'

describe Client do

  it { should have_many :counselors }
  it { should have_many :concerns }
  it { should have_many :issues }
  it { should have_many :counseling_sessions }
  it { should have_many :payment_notifications }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :time_zone }

  it { should have_db_column :session_credits }
  it { should validate_numericality_of :session_credits }

  describe "#purchase_token" do
    let!(:client) { Fabricate(:client) }
    let(:salty) { Time.now.to_f + client.email }
    before do
      Time.stub_chain(:now, :to_f).and_return("12345678.1234")
    end
    it "returns a 40 character string generated from time and the client email" do
      Digest::SHA1.should_receive(:hexdigest).with(salty)
      client.purchase_token
    end
  end

  describe "#increase_session_credits('2 Sessions')" do
    let!(:client) { Fabricate(:client) }
    context "when package is '1 Session'" do
      let(:package) { "1 Session" }
      it "increases the session_credits by 1" do
        expect { client.increase_session_credits(package) }.to change{client.session_credits}.from(0).to(1)
      end
    end
    context "when package is '2 Sessions'" do
      let(:package) { "2 Sessions" }
      it "increases the session_credits by 2" do
        expect { client.increase_session_credits(package) }.to change{client.session_credits}.from(0).to(2)
      end
    end
    context "when package is '4 Sessions'" do
      let(:package) { "4 Sessions" }
      it "increases the session_credits by 4" do
        expect { client.increase_session_credits(package) }.to change{client.session_credits}.from(0).to(4)
      end
    end
    context "without a package" do
      let(:package) { nil }
      it "increases the session_credits by 4" do
        expect { client.increase_session_credits(package) }.not_to change{client.session_credits}
      end
    end
  end

  context "when personal information is required" do

    before do
      subject.stub(:personal_information_required?).and_return(true)
    end

    it { should validate_presence_of :gender }
    it { should validate_presence_of :relationship_status }
    it { should validate_presence_of :employment_status }
    it { should validate_presence_of :education }

  end

  context "when emergency contact is required" do

    before do
      subject.stub(:emergency_contact_required?).and_return(true)
    end

    it { should validate_presence_of :emergency_contact_name }
    it { should validate_presence_of :emergency_contact_phone_number }
    it { should validate_presence_of :emergency_contact_relationship }
    it { should validate_acceptance_of :emergency_contact_permitted }

  end

end
