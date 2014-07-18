class PartnershipsController < ApplicationController
  def create
    @partnership = current_user.partnerships.build(:partner_id => params[:partner_id])
    if @partnership.save
      flash[:notice] = "Added partner."
      redirect_to root_url
    else
      flash[:error] = "Unable to add partner."
      redirect_to root_url
    end
  end
  
  def destroy
    @partnership = current_user.partnerships.find(params[:id])
    @partnership.destroy
    flash[:notice] = "Removed partnership."
    redirect_to current_user
  end
end