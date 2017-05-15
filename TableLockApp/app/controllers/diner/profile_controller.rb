class Diner::ProfileController < ApplicationController
  before_action :require_diner, only:[:view ,:update]
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
      if @diner.save
        flash[:success]="You have successfully updated your profile "
        redirect_to '/diner/profile'
      else
        @diner.errors.full_messages.each do |message|
          flash[:error]=message
        end
      end

    else
      @diner.errors.full_messages.each do |message|
        flash[:error]=message
      end
      #flash[:error]="Error updating profile "
      redirect_to '/diner/profile'
    end
    #find an existing object


  end
  def change_pic
    if request.post?

      @diner=Diner.find(session[:diner_id])
      @diner.update_attributes(pic_params)
      flash[:success]="Profile picture updated successfully"
    end


  end
  def profile
    if params[:term]
      @restaurants=Restaurant.joins("RIGHT OUTER JOIN dining_informations ON restaurants.id = dining_informations.restaurant_id").where("restaurant_name LIKE ? OR city LIKE ? OR province LIKE ?","%#{params[:term]}%","%#{params[:term]}%","%#{params[:term]}%")


    else
      @restaurants=Restaurant.all
    end
    @diner=Diner.find_by_user_id(session[:user_id])
    @array=[]
    @restaurants.each do |r|
      @array<<{r:r.restaurant_name,c:r.city}
    end
    respond_to do |format|
      puts "here"
      format.html # index.html.erb
# Here is where you can specify how to handle the request for "/people.json"
      puts @restaurants.map { |rest| {:id => rest.id, :label =>  rest.restaurant_name+" "+ rest.city, :value => rest.restaurant_name+" "+ rest.city }}
# format.json { render :json =>@array.to_json
# }
      format.json{render :json => @restaurants.map { |rest| {:id => rest.id, :label =>  rest.restaurant_name+" "+ rest.city, :value => rest.restaurant_name+" "+ rest.city, :category=>"restaurant"} }
      }
    end

  end
  private

  def diner_params
    params.require(:diner).permit(:first_name, :last_name, :telephone,:dob,:add_line1,:add_line2, :city,:province,:postal_code)
  end

  def pic_params
    params.permit(:avatar)
  end

end
