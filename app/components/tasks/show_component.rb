module Tasks
  class ShowComponent < ViewComponent::Base
    def initialize(task:)
      @task = task
    end
  end
end
