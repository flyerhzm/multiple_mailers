require 'spec_helper'

describe MultipleMailers do
  describe ".mail_account" do
    context "default" do
      let(:config) { ActionMailer::Base.smtp_settings }

      it "gets address with smtp.gmail.com" do
        expect(config[:address]).to eq "smtp.gmail.com"
      end

      it "get port with 587" do
        expect(config[:port]).to eq 587
      end

      it "gets domain with railsbp.com" do
        expect(config[:domain]).to eq "railsbp.com"
      end

      it "gets authentication with plain" do
        expect(config[:authentication]).to eq "plain"
      end

      it "gets user_name with nil" do
        expect(config[:user_name]).to be_nil
      end

      it "gets password with nil" do
        expect(config[:password]).to be_nil
      end
    end

    context "notification" do
      let(:config) {
        ActionMailer::Base.class_eval { mailer_account "notification" }
        ActionMailer::Base.smtp_settings
      }

      it "gets address with smtp.gmail.com" do
        expect(config[:address]).to eq "smtp.gmail.com"
      end

      it "get port with 587" do
        expect(config[:port]).to eq 587
      end

      it "gets domain with railsbp.com" do
        expect(config[:domain]).to eq "railsbp.com"
      end

      it "gets authentication with plain" do
        expect(config[:authentication]).to eq "plain"
      end

      it "gets user_name with notification@railsbp.com" do
        expect(config[:user_name]).to eq "notification@railsbp.com"
      end

      it "gets password with password" do
        expect(config[:password]).to eq "password"
      end
    end
  end
end
