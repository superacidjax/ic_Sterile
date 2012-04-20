require 'spec_helper'

describe UsersHelper do
  describe "#edit_account_path_for" do
    subject { edit_account_path_for(current_user) }
    context 'when the user is a counselor' do
      let(:current_user) { Counselor.new }
      it { should == edit_counselor_account_path }
    end
    context 'when the user is a client' do
      let(:current_user) { Client.new }
      it { should == edit_client_account_path }
    end
  end

  describe '#highest_education_for' do
    let(:counselor) { Counselor.new }
    subject { highest_education_for(counselor) }
    context 'when the highest education is undergraduate' do
      before { counselor.undergraduate_degree = 'Bachelorate of the Sciences' }
      it { should == 'Bachelorate of the Sciences' }
    end
    context 'when the highest education is graduate' do
      before { counselor.graduate_degree = 'Masters of Sciences' }
      it { should == 'Masters of Sciences' }
    end
    context 'when the highest education is doctoral' do
      before { counselor.doctoral_degree = 'Medical Doctor' }
      it { should == 'Medical Doctor' }
    end
  end

  describe "issues_for" do
    subject { helper.issues_for(client) }
    let(:client) { Fabricate(:client) }

    context "when there are issues" do
      context "when there is a limit" do
        subject { helper.issues_for(client, limit) }

        before do
          client.issues << Issue.where(name: 'anger')
          client.issues << Issue.where(name: 'bullying')
          client.issues << Issue.where(name: 'fears')
        end

        context "and the number of specialties is less than the limit" do
          let(:limit) { 5 }
          it { should == "Anger, Bullying, Fears/Phobias" }
        end

        context "and the number of specialties equals the limit" do
          let(:limit) { 3 }
          it { should == "Anger, Bullying, Fears/Phobias" }
        end

        context "and the number of specialties exceeds limit" do
          let(:limit) { 2 }
          it { should == "Anger, Bullying" }
        end
      end

      context "when there is not a limit" do
        before do
          client.issues << Issue.where(name: 'anger')
          client.issues << Issue.where(name: 'bullying')
        end

        it { should == "Anger, Bullying" }

        context "when there are other issues" do
          before { client.update_attributes(other_issues: 'pineapple') }

          it { should == "Anger, Bullying, pineapple" }
        end
      end

      context "when there are othe issues" do
        before { client.update_attributes(other_issues: 'pineapple') }

        it { should == "pineapple" }
      end
    end
  end

  describe '#standard_and_other_for' do
    let(:user) { stub(:languages => %w(en es), :other_languages => "Pig latin, Hebrew") }
    subject { standard_and_other_for(user, :languages) }
    it { should == "English, Spanish, Pig latin, Hebrew" }
  end
end
