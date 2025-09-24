require "rails_helper"

RSpec.describe Projects::TileComponent, type: :component do
  let(:project) { create(:project) }

  it "renders a clickable tile with project name and buttons" do
    render_inline(described_class.new(project: project))

    expect(rendered_content).to include(project.name)
    expect(rendered_content).to have_selector("a[href='#{edit_project_path(project)}']")
    expect(rendered_content).to have_selector("a[data-turbo-method='delete']")
    expect(rendered_content).to have_selector("button, a")
  end
end
