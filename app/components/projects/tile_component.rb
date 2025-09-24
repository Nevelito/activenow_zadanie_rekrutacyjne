module Projects
  class TileComponent < ViewComponent::Base
    def initialize(project:)
      @project = project
    end
  end
end
