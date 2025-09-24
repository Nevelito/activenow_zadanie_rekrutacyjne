module Tasks
  class FormComponent < ViewComponent::Base
    def initialize(task:, project:, title:)
      @task = task
      @project = project
      @title = title
    end
  end
end
