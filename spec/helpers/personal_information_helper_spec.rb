require 'spec_helper'

describe PersonalInformationHelper do
  describe "#personal_information_path" do
    let(:client) { Client.new }
    subject{ helper.personal_information_path }
    before { helper.stub(:current_user).and_return(client) }

    context "when the client has personal information" do
      before { client.stub(:personal_information?).and_return(true) }
      it "returns an edit link" do
        should == edit_client_account_personal_information_path
      end
    end
    context "when the client has no personal information" do
      before { client.stub(:personal_information?).and_return(false) }
      it "returns a new link" do
        should == new_client_account_personal_information_path
      end
    end
  end
end
