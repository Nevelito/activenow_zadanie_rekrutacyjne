require "rails_helper"

RSpec.describe Projects::ColComponent, type: :component do
  include Rails.application.routes.url_helpers

  let(:project) { create(:project) }

  it "renders the column with title and task count" do
    render_inline(described_class.new(project: project, title: "Do zrobienia", status: "todo"))

    expect(rendered_content).to include("Do zrobienia")
    expect(rendered_content).to include("Ilość zadań: #{project.tasks.todo.count}")
    expect(rendered_content).to have_selector("div[data-kanban-target='column']")
  end
end
