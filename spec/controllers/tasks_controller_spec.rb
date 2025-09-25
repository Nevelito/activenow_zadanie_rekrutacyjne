require "rails_helper"

RSpec.describe TasksController, type: :controller do
  include ActiveJob::TestHelper

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  before do
    sign_in user
    ActiveJob::Base.queue_adapter = :test
  end

  describe "POST #create" do
    context "with valid params" do
      let(:task_params) { { title: "Nowe zadanie", due_date: Date.tomorrow, status: :todo } }

      it "creates new task and enqueue new job" do
        expect {
          post :create, params: { project_id: project.id, task: task_params }
        }.to change(Task, :count).by(1)
                                 .and have_enqueued_job(TaskDueReminderJob)
      end
    end

    context "without due_date" do
      let(:task_params) { { title: "Zadanie bez terminu", status: :todo } }

      it "creates new task, but does not enqueue job" do
        expect {
          post :create, params: { project_id: project.id, task: task_params }
        }.to change(Task, :count).by(1)

        expect(TaskDueReminderJob).not_to have_been_enqueued
      end
    end
  end

  describe "PATCH #update" do
    let!(:task) { create(:task, project: project, due_date: Date.today) }

    context "changing due_date" do
      it "enqueues new job" do
        patch :update, params: { project_id: project.id, id: task.id, task: { due_date: Date.tomorrow } }

        expect(TaskDueReminderJob).to have_been_enqueued.with(task.id)
      end
    end

    context "with no changing due_date" do
      it "does not enqueue new job" do
        patch :update, params: { project_id: project.id, id: task.id, task: { title: "Nowy tytuł" } }

        expect(TaskDueReminderJob).not_to have_been_enqueued
      end
    end
  end
end
