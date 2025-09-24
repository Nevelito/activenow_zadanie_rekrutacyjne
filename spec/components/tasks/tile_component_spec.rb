require "rails_helper"

RSpec.describe Tasks::TileComponent, type: :component do
  let(:project) { create(:project) }
  let(:task) { create(:task, project: project, title: "Test task") }

  it "renders draggable task tile with title and menu button" do
    render_inline(described_class.new(task: task))

    expect(rendered_content).to include(task.title)
    expect(rendered_content).to include('draggable="true"')
    expect(rendered_content).to match(/href="#{project_task_path(task.project, task)}"/)
    expect(rendered_content).to have_selector("button, a")
  end
end
