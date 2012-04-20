require 'spec_helper'

describe Addressable do
  let(:user) { mock 'User' }
  subject { user.extend(Addressable) }

  describe "#us?" do
    before { subject.stub(:country).and_return(country) }

    context "when country is not US" do
      let(:country) { 'CA' }
      its(:us?) { should be_false }
    end

    context "when country is US" do
      let(:country) { 'US' }
      its(:us?) { should be_true }
    end
  end

  describe "#location" do
    before do
      subject.stub(:city).and_return("Dover")
      subject.stub(:state_or_province).and_return("DE")
    end

    context "for a user outside the US" do
      before { subject.stub(:country).and_return('UK') }

      its(:location) { should eq('Dover, UK') }
    end

    context "for a user in the US" do
      before { subject.stub(:us?).and_return(true) }

      its(:location) { should eq('Dover, DE') }
    end
  end
end
