class GroupsController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]
  require 'csv'


  private
  def secure_params
    params.require(:group).permit(:name)
  end
end