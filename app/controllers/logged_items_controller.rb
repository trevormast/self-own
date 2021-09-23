class LoggedItemsController < ApplicationController
  before_action :set_user

  def new
    @new_logged_item = @user.logged_items.new
  end

  def create
    @new_logged_item = @user.logged_items.new(logged_item_params)

    if @new_logged_item.save
      flash[:notice] = "Logged Item Created"

      redirect_to root_path
    else
      flash[:alert] = @new_logged_item.errors.full_messages.join(', ')

      redirect_to new_user_logged_item_path(@user)
    end
  end

  def edit
    @logged_item = LoggedItem.find(params[:id])

    @logs = @logged_item.logs.order(created_at: :asc)
  end

  def update
    @logged_item = LoggedItem.find(params[:id])

    if @logged_item.update(logged_item_params)
      flash[:notice] = "Logged Item Updated"

      redirect_to root_path
    else
      flash[:alert] = @new_logged_item.errors.full_messages.join(', ')

      redirect_to edit_user_logged_item_path(@user, @logged_item)
    end
  end

  private

    def logged_item_params
      params.require(:logged_item).permit(:name, :value_type, :color, :unit, logs_attributes: [:id, :created_at, :value])
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
