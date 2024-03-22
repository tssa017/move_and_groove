module ApplicationHelper
    def current_page?(path)
        'active' if request.path == path
      end
end
