module Tasks
  class TileComponent < ViewComponent::Base
    def initialize(task:)
      @task = task
    end
  end
end
