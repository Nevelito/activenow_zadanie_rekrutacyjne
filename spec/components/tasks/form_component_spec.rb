require "rails_helper"

RSpec.describe Tasks::FormComponent, type: :component do
  let(:project) { create(:project) }
  let(:task) { build(:task, project: project) }
  let(:title) { "Dodaj zadanie" }

  it "renders form fields and buttons" do
    render_inline(described_class.new(task: task, project: project, title: title))

    expect(rendered_content).to include(title)
    expect(rendered_content).to include('label for="task_title"')
    expect(rendered_content).to include('label for="task_description"')
    expect(rendered_content).to include('label for="task_due_date"')
    expect(rendered_content).to include('label for="task_status"')
    expect(rendered_content).to include("Anuluj")
    expect(rendered_content).to include(task.persisted? ? "Zapisz zmiany" : "Dodaj zadanie")
  end
end
