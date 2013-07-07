require 'spec_helper'

module MultipleMailers
  describe Configuration do
    describe ".get" do
      context "notification" do
        let(:config) { Configuration.get("notification") }

        it "gets address with smtp.gmail.com" do
          expect(config["address"]).to eq "smtp.gmail.com"
        end

        it "get port with 587" do
          expect(config["port"]).to eq 587
        end

        it "gets domain with railsbp.com" do
          expect(config["domain"]).to eq "railsbp.com"
        end

        it "gets authentication with plain" do
          expect(config["authentication"]).to eq "plain"
        end

        it "gets user_name with notification@railsbp.com" do
          expect(config["user_name"]).to eq "notification@railsbp.com"
        end

        it "gets password with password" do
          expect(config["password"]).to eq "password"
        end
      end

      context "exception_notifier" do
        let(:config) { Configuration.get("exception.notifier") }

        it "gets address with smtp.gmail.com" do
          expect(config["address"]).to eq "smtp.gmail.com"
        end

        it "get port with 587" do
          expect(config["port"]).to eq 587
        end

        it "gets domain with railsbp.com" do
          expect(config["domain"]).to eq "railsbp.com"
        end

        it "gets authentication with plain" do
          expect(config["authentication"]).to eq "plain"
        end

        it "gets user_name with exception.notifier@railsbp.com" do
          expect(config["user_name"]).to eq "exception.notifier@railsbp.com"
        end

        it "gets password with password" do
          expect(config["password"]).to eq "password"
        end
      end
    end
  end
end
