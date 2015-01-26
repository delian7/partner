class RosterController < ApplicationController
  
  def index
    @rosters = Roster.all
  end
  
  def create
    @roster = Roster.new(roster_params)
    
    if @roster.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  
  def destroy
    @roster = Roster.find(params[:id])
    @roster.destroy
    @roster.save
    redirect_to(:action => 'index')
  end

  def update
    @roster = Roster.find(params[:id])
    
    if @roster.update_attributes(roster_params)
      flash[:notice] = "Roster updated successfully"
      redirect_to(:action => 'index')
    else
      flash[:error] = "Roster could not be updated"
      render('edit')
    end
  end

  def remove
    @roster = Roster.find(params[:id])
    @roster.destroy
    if @roster.save
      flash[:notice] = "Roster Deleted"
    else
      flash[:error] = "Roster could not be deleted"
    end
    redirect_to(:action => 'index')
  end
  
  private 
  
  def roster_params
    params.require(:roster).permit(:user_id, :course_id)
  end 
  
end
