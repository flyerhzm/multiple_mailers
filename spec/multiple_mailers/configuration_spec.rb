require 'spec_helper'

module MultipleMailers
  describe Configuration do
    context ".load" do
      it "should read config/mailers.yml" do
        Configuration.load
        Configuration.instance_variable_get(:@configurations).should_not be_empty
      end
    end

    context ".get" do
      before { Configuration.load }

      it "should get configuration for notification" do
        config = Configuration.get("notification")
        config["address"].should == "smtp.gmail.com"
        config["port"].should == 587
        config["domain"].should == "railsbp.com"
        config["authentication"].should == "plain"
        config["user_name"].should == "notification@railsbp.com"
        config["password"].should == "password"
      end

      it "should get configuration for exception_notifier" do
        config = Configuration.get("exception.notifier")
        config["address"].should == "smtp.gmail.com"
        config["port"].should == 587
        config["domain"].should == "railsbp.com"
        config["authentication"].should == "plain"
        config["user_name"].should == "exception.notifier@railsbp.com"
        config["password"].should == "password"
      end
    end
  end
end
