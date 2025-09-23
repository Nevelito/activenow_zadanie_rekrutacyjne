require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { create(:project) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it "has a name with reasonable length" do
    subject.name = "a" * 151
    expect(subject).not_to be_valid

    subject.name = "ab"
    expect(subject).not_to be_valid
  end

  it "belongs to a user" do
    expect(subject.user).to be_present
  end

  it "can have many tasks" do
    task1 = create(:task, project: subject)
    task2 = create(:task, project: subject)
    expect(subject.tasks).to include(task1, task2)
  end
end
