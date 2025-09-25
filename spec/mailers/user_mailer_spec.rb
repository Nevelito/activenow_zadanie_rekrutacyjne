require "rails_helper"
require "ostruct"

RSpec.describe UserMailer, type: :mailer do
  describe "#welcome_email" do
    let(:user) { OpenStruct.new(name: "Jan", email: "jan@example.com") }
    let(:mail) { UserMailer.welcome_email(user) }

    it "sets correct subject" do
      expect(mail.subject).to eq("Witaj w naszej aplikacji 🚀")
    end

    it "sends to correct user" do
      expect(mail.to).to eq([user.email])
    end

    it "sets correct from user" do
      expect(mail.from).to eq(["no-reply@activenow.com"])
    end

    it "contains link to app" do
      expect(mail.body.encoded).to include("http://localhost:3000/projects")
    end
  end
end
