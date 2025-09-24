module Projects
  class ColComponent < ViewComponent::Base
    def initialize(project:, title:, status:)
      @project = project
      @title = title
      @status = status
    end
  end
end
