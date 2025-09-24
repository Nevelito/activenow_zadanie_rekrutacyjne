require "rails_helper"

RSpec.describe Projects::ShowComponent, type: :component do
  let(:project) { create(:project) }

  it "renders project header and new task button" do
    render_inline(described_class.new(project: project))

    expect(rendered_content).to include("Zadania")
    expect(rendered_content).to have_link("Dodaj zadanie")
    expect(rendered_content).to have_selector("div[data-controller='kanban']")
  end
end
