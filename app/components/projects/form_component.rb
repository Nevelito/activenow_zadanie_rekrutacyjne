module Projects
  class FormComponent < ViewComponent::Base
    def initialize(project:, user:)
      @project = project
      @user = user
    end
  end
end
