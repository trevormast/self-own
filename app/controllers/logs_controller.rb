class LogsController < ApplicationController
  before_action :set_logged_item

  def index
    @logs = @logged_item.logs.order(created_at: :asc)
  end

  def new
    # create the log automatically if one_step_logging
    create_log_and_redirect(value: "1") if @logged_item.one_step_logging?

    @new_log = @logged_item.logs.new

    render 'new_quality_log' if @logged_item.value_type == 'quality'
  end

  def create
    create_log_and_redirect(log_params)
  end

  private

    def log_params
      params.require(:log).permit(:value)
    end

    def create_log_and_redirect(create_params)
      @new_log = @logged_item.logs.new(create_params)

      if @new_log.save
        flash[:notice] = "#{ @logged_item.name.titleize } logged"

        redirect_to root_path and return
      else
        flash[:alert] = @new_log.errors.full_messages.join(', ')

        redirect_to new_logged_item_log_path(@logged_item) and return
      end
    end

    def set_logged_item
      @logged_item = LoggedItem.find(params[:logged_item_id])
    end
end
