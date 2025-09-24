module Projects
  class GridComponent < ViewComponent::Base
    def initialize(projects:)
      @projects = projects
    end
  end
end
