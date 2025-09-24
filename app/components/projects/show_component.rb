module Projects
  class ShowComponent < ViewComponent::Base
    def initialize(project:)
      @project = project
    end
  end
end
