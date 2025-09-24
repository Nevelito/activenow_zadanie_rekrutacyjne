require "rails_helper"

RSpec.describe Projects::GridComponent, type: :component do
  let(:projects) { create_list(:project, 3) }

  it "renders a grid of projects" do
    render_inline(described_class.new(projects: projects))

    projects.each do |project|
      expect(rendered_content).to include(project.name)
    end
    expect(rendered_content).to have_selector("div.grid")
  end
end
