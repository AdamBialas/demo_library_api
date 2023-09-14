module Api
  module V1
    module ApplicationHelper
      def pagination(meta_info)
        {
          current_page: meta_info.page,
          total_pages: meta_info.last,
          per_page_count: meta_info.items,
          total_count: meta_info.count,
        }
      end
    end
  end
end
