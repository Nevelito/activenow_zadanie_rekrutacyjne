FactoryBot.define do
  factory :task do
    sequence(:title) { |n| "Task #{n}" }
    description { "Sample task description" }
    status { :todo }        # enum
    due_date { Date.today + 7.days }
    association :project
  end
end
