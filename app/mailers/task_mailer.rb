class TaskMailer < ApplicationMailer
  default from: "no-reply@activenow.com"

  def due_soon_email(task)
    @task = task
    @project = task.project
    mail(
      to: @project.user.email,
      subject: "Przypomnienie: Zadanie #{@task.title} kończy się jutro"
    )
  end
end
