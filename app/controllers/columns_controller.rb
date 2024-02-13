class ColumnsController < ApplicationController
  before_action :set_column, only: %i[ show update destroy ]

  def index
    @columns = Column.all

    render json: @columns
  end

  def show
    render json: @column
  end

  def create
    @column = Column.new(column_params)

    if @column.save
      render json: @column, status: :created, location: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  def update
    if @column.update(column_params)
      render json: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @column.destroy!
  end

  private
    def set_column
      @column = Column.find(params[:id])
    end

    def column_params
      params.require(:column).permit(:title, :board_id)
    end
end
