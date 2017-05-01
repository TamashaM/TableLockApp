class Restaurant::PaymentsController < ApplicationController
  before_action :require_restaurant
  protect_from_forgery
  def view

    if request.post?
      require 'set'
      @month=params[:month]
      #replace with session[:restaurant_id]
      time_slots=TimeSlot.where('extract(month from date) = ?', "#{@month}").where("restaurant_id = ?","#{session[:restaurant_id]}")
      # payments=Reservation.select(("restaurant_id , sum(payment_amount) as total_payment").where('extract(day   from date_column) = ?', desired_day_of_month).group("restaurant_id"))
      @transactions=[]

      time_slots.each do |ts|
        payments=ts.reservations
        payments.each do |p|
          if p.payment_status==1
            @transactions<<p
          end
        end

      end
    end

  end

  def print_report
    @month=params[:month]
    #replace with session[:restaurant_id]
    time_slots=TimeSlot.where('extract(month from date) = ?', "#{@month}").where("restaurant_id = ?","#{session[:restaurant_id]}")
    # payments=Reservation.select(("restaurant_id , sum(payment_amount) as total_payment").where('extract(day   from date_column) = ?', desired_day_of_month).group("restaurant_id"))
    @transactions=[]

    time_slots.each do |ts|
      payments=ts.reservations
      payments.each do |p|
        if p.payment_status==1
          @transactions<<p
        end
      end

    end
    require "pdfkit"
    html=render_to_string(:action=>"print_report", :locals=>{:month=>@month})
    @kit  = PDFKit.new(html)

    @kit.to_file("hello.pdf")
    send_data @kit.to_pdf, :filename => "payments.pdf",
              :type => "application/pdf",
              :disposition  => "attachment" # either "inline" or "attachment"

    return
  end
  private

  def as_html
    render template: "restaurant/payments/print_report"

  end
end
