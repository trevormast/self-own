class LogsController < ApplicationController
  before_action :set_logged_item
  before_action :one_step_log, only: [:new]

  def index
    @logs = @logged_item.logs
  end

  def new
    @new_log = @logged_item.logs.new

    render 'new_quality_log' if @logged_item.value_type == 'quality'
  end

  def create
    create_log(log_params)
  end

  private

    def log_params
      params.require(:log).permit(:value)
    end

    def create_log(create_params)
      @new_log = @logged_item.logs.new(create_params)

      if @new_log.save
        flash[:notice] = "#{ @logged_item.name.titleize } logged"

        redirect_to root_path
      else
        flash[:alert] = @new_log.errors.full_messages.join(', ')

        redirect_to new_logged_item_log_path(@logged_item)
      end
    end

    def set_logged_item
      @logged_item = LoggedItem.find(params[:logged_item_id])
    end

    def one_step_log
      if @logged_item.one_step_logging?
        create_log(value: "")
      end
    end
end
