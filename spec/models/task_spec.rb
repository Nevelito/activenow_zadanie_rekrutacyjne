require 'rails_helper'

RSpec.describe Task, type: :model do
  subject { create(:task) }

  it "is valid with a title" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it "belongs to a project" do
    expect(subject.project).to be_present
  end

  it "has valid enum statuses" do
    expect(Task.statuses.keys).to include("todo", "in_progress", "done")
  end
end
