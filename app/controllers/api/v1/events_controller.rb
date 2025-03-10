module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_user
      include Pagination
      helper_method :page_no, :per_page, :paginate_offset

      def index
        @events = @user.events
        @events = @events.limit(per_page).offset(paginate_offset)
        @total_pages = (Event.count.to_f / per_page).ceil
        render json: { events: @events, total_pages: @total_pages, current_page: page_no }
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
