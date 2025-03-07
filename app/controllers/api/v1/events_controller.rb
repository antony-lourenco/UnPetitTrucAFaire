module Api
  module V1
    class EventsController < ApplicationController
      before_action :set_user

      def index
        @events = @user.events
        render json: @events
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
