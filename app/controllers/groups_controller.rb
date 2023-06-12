class GroupsController < ApplicationController
  before_action :find_group, except: [:create, :index]

  def index
    @groups = Group.all
    render json: @groups, status: :ok
  end

  def show
    render json: @group, status: :ok
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      render json: @group, status: :created
    else
      render json: {errors: @group.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def update
    unless @group.update(group_params)
      render json: { errors: @group.errors.full_messages},
             status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
  end

  private

  def group_params
    params.permit(
      :groupname
    )
  end

  def find_group
    @group = Group.find_by_group_name!(params[:groupname])
  rescue ActiveRecord::RecordNotFound
    render json: {errors: 'group not found'}, status: :not_found
  end
end
