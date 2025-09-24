require "rails_helper"

RSpec.describe Projects::FormComponent, type: :component do
  let(:user) { create(:user) }
  let(:project) { build(:project, user: user) }

  it "renders the project form" do
    render_inline(described_class.new(project: project, user: user))

    expect(rendered_content).to have_selector("form")
    expect(rendered_content).to have_field("project[name]")
  end

  it "shows correct submit text for new project" do
    render_inline(described_class.new(project: Project.new, user: user))
    expect(rendered_content).to include("Dodaj projekt")
  end

  it "shows correct submit text for persisted project" do
    persisted_project = create(:project, user: user)
    render_inline(described_class.new(project: persisted_project, user: user))
    expect(rendered_content).to include("Zapisz zmiany")
  end
end
