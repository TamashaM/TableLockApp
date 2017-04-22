class Diner::ProfileController < ApplicationController

  protect_from_forgery

  def view
    #try with params[:id] as well
    @diner=Diner.find(session[:diner_id])
    @user=User.find(session[:user_id])
  end
  def update
    #diner profile update
    @diner=Diner.find(session[:diner_id])
    if @diner.update_attributes(diner_params)
      @diner.dob=Date.strptime(params[:diner][:dob],'%m/%d/%Y')
      @diner.save!
      flash[:success]="You have successfully updated your profile "
      redirect_to '/diner/profile'
    else
      flash[:error]="Error updating profile "
      render('view')
    end
    #find an existing object


  end
  private

  def diner_params
    params.require(:diner).permit(:first_name, :last_name, :telephone,:dob,:add_line1,:add_line2, :city,:province,:postal_code)
  end

end
