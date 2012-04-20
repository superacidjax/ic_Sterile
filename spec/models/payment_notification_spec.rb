# require 'spec_helper'

# describe PaymentNotification do

  # let(:params) do
    # "mc_gross=99.00&protection_eligibility=Ineligible&payer_id=RAZAR42TZLXHG&tax=0.00&payment_date=11:32:21+Oct+31,+2011+PDT&payment_status=Completed&charset=windows-1252&first_name=Test&option_selection1=1+Session&mc_fee=3.17&notify_version=3.4&custom=&payer_status=verified&business=seller_1302635622_biz@icouch.me&quantity=1&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31Abb.6jWNDpkBitoBTdlgP2Qq0MP2&payer_email=buyer_1302635676_per@icouch.me&option_name1=Package&txn_id=0VY77002R70379602&payment_type=instant&btn_id=2325511&last_name=User&receiver_email=seller_1302635622_biz@icouch.me&payment_fee=3.17&shipping_discount=0.00&insurance_amount=0.00&receiver_id=ECK3NNZQMLBSE&txn_type=web_accept&item_name=iCouch+Counselor+Sessions&discount=0.00&mc_currency=USD&item_number=&residence_country=US&test_ipn=1&handling_amount=0.00&shipping_method=Default&transaction_subject=iCouch+Counselor+Sessions&payment_gross=99.00&shipping=0.00"
  # end
  # let(:client) { Fabricate(:client) }
  # let(:payment_notification) { client.payment_notifications.create(token: client.purchase_token) }

  # it { should belong_to :client }

  # describe "#process_ipn(raw_post)" do
    # let(:purchased_credit_count) { 1 }

    # context "with a 'completed' status" do

      # it "increments tokens if successful payment and secret matches" do
        # payment_notification.client.should_receive(:increase_session_credits).with('1 Session')
        # payment_notification.process_ipn(params)
      # end

      # it "sets the status to 'completed'" do
        # expect {payment_notification.process_ipn(params)}.to change{payment_notification.status}.from("pending").to("completed")
      # end

    # end

    # context "with anything other than a status of 'completed'" do
      # let(:params) { "payment_status=Failed" }
      # it "sets the status to 'cancelled'" do
        # expect {payment_notification.process_ipn(params)}.to change{payment_notification.status}.from("pending").to("cancelled")
      # end
    # end

  # end

  # describe "#ipn" do

    # before do
      # payment_notification.stub(:params).and_return(params)
    # end

    # it "parses the raw Paypal Notification" do
      # ActiveMerchant::Billing::Integrations::Paypal::Notification.should_receive(:new).with(params)
      # payment_notification.ipn
    # end

  # end

# end
