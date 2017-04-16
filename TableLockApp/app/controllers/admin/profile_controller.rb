class Admin::ProfileController < ApplicationController
  protect_from_forgery
  def create

  end
  def view
    #try with params[:id] as well
    @admin=Admin.find(session[:admin_id])
    @user=User.find(session[:user_id])
  end
  def update
    #diner profile update
    @admin=Admin.find(params[:admin][:id])
    if @admin.update_attributes(admin_params)
      redirect_to '/admin/profile'
    else
      render('view')
    end
    #find an existing object
  end
  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :telephone)
  end
end
