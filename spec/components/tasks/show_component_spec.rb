require "rails_helper"

RSpec.describe Tasks::ShowComponent, type: :component do
  let(:project) { create(:project) }
  let(:task) { create(:task, project: project, title: "Test task", description: "Opis zadania") }

  it "renders task title, description, and action buttons" do
    render_inline(described_class.new(task: task))

    expect(rendered_content).to include(task.title)
    expect(rendered_content).to include(task.description)
    expect(rendered_content).to match(/href="#{edit_project_task_path(task.project, task)}"/)
    expect(rendered_content).to match(/data-turbo-method="delete"/)
  end
end
