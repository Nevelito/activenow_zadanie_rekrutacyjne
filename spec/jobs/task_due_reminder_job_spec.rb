# spec/jobs/task_due_reminder_job_spec.rb
require "rails_helper"

RSpec.describe TaskDueReminderJob, type: :job do
  include ActiveJob::TestHelper

  let(:user)    { create(:user, email: "anna@example.com") }
  let(:project) { create(:project, user: user) }

  before do
    ActiveJob::Base.queue_adapter = :test
  end

  describe "#perform" do
    it "sends new email when due_date is tommorow" do
      task = create(:task, title: "Raport kwartalny", project: project, due_date: Time.zone.tomorrow.to_date)

      expect {
        described_class.perform_now(task.id)
      }.to have_enqueued_mail(TaskMailer, :due_soon_email).with(task)
    end

    it "does not sends email when due_date is different then tommorow" do
      task = create(:task, title: "Raport kwartalny", project: project, due_date: Date.today + 2.days)

      expect {
        described_class.perform_now(task.id)
      }.not_to have_enqueued_mail(TaskMailer, :due_soon_email)
    end

    it "does not sends email when the task do not exist" do
      expect {
        described_class.perform_now(999_999)
      }.not_to have_enqueued_mail(TaskMailer, :due_soon_email)
    end
  end
end
