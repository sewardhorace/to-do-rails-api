class ToDosController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :html, :json

  def index
    @todos = ToDo.all
    render json: @todos
  end

  def new
    @todo = ToDo.new
    render json: @todo  #???
  end

  def create
    puts params
    @todo = ToDo.new(to_do_params)
    @todo.completed = false
    if @todo.save
      head :created, location: to_do_path(@todo)
    else
      head :bad_request
    end
  end

  def show
    @todo = ToDo.find(params[:id])
    render json: @todo
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
