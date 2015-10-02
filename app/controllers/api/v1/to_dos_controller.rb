module Api
  module V1
    class ToDosController < Api::V1::ApiController
      skip_before_filter :verify_authenticity_token

      def index
        @todos = ToDo.all
        render json: @todos
      end

      def create
        @todo = ToDo.new(to_do_params)
        @todo.completed = false
        if @todo.save
          head :created, location: to_do_path(@todo)
        else
          head :bad_request
        end
      end

      def update
        @todo = ToDo.find(params[:id])

        if @todo.update(to_do_params)
          head :ok, location: to_do_path(@todo)
        else
          head :bad_request
        end
      end

      def destroy
        @todo = ToDo.find(params[:id])
        @todo.destroy
        head :ok, location: to_do_path(@todo)
      end

      private
      def to_do_params
        params.require(:to_do).permit(:title, :description, :due_date, :priority, :completed)
      end
    end
  end
end
