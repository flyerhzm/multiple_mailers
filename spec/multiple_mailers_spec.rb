require 'spec_helper'

describe MultipleMailers do
  context ".mail_account" do
    before { ActionMailer::Base.send(:include, MultipleMailers) }

    it "should set default configuration" do
      default_config = ActionMailer::Base.smtp_settings
      default_config[:address].should == "smtp.gmail.com"
      default_config[:port].should == 587
      default_config[:domain].should == "railsbp.com"
      default_config[:authentication].should == "plain"
      default_config[:user_name].should be_nil
      default_config[:password].should be_nil
    end

    it "should set notification configuration" do
      ActionMailer::Base.class_eval { mailer_account "notification" }
      default_config = ActionMailer::Base.smtp_settings
      default_config[:address].should == "smtp.gmail.com"
      default_config[:port].should == 587
      default_config[:domain].should == "railsbp.com"
      default_config[:authentication].should == "plain"
      default_config[:user_name].should == "notification@railsbp.com"
      default_config[:password].should == "password"
    end
  end
end
