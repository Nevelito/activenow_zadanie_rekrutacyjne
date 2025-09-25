class TaskDueReminderJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return unless task && task.due_date == Time.zone.tomorrow.to_date

    TaskMailer.due_soon_email(task).deliver_later
  end
end
