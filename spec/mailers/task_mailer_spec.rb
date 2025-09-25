require "rails_helper"
require "ostruct"

RSpec.describe TaskMailer, type: :mailer do
  describe "#due_soon_email" do
    let(:user)    { OpenStruct.new(email: "anna@example.com") }
    let(:project) { OpenStruct.new(user: user) }
    let(:task)    { OpenStruct.new(title: "Raport kwartalny", project: project) }

    let(:mail) { TaskMailer.due_soon_email(task) }

    it "sets correct subject" do
      expect(mail.subject).to eq("Przypomnienie: Zadanie Raport kwartalny kończy się jutro")
    end

    it "sends to correct user" do
      expect(mail.to).to eq([user.email])
    end

    it "sets correct from user" do
      expect(mail.from).to eq(["no-reply@activenow.com"])
    end

    it "contains task title" do
      expect(mail.body.encoded).to include(task.title)
    end
  end
end
