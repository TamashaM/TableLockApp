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
    @admin=Admin.find(session[:admin_id])
    if @admin.update_attributes(admin_params)
      flash[:success]="Data updated successfully"
      redirect_to '/admin/profile'
    else
      @admin.errors.full_messages.each do |message|
        flash[:error]=message
      end
      redirect_to(:back)
    end
    #find an existing object
  end
  def change_pic
    if request.post?

      @admin=Admin.find(session[:admin_id])
      @admin.update_attributes(pic_params)
      flash[:success]="Profile picture updated successfully"
    end


  end
  private

  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :telephone)
  end

  def pic_params
    params.permit(:avatar)
  end
end
