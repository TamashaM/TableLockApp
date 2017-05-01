class Admin::PaymentsController < ApplicationController
  before_action :require_admin
  protect_from_forgery
  def view

    if request.post?
      require 'set'
      @month=params[:month]
      time_slots=TimeSlot.where('extract(month from date) = ?', "#{@month}")
     # payments=Reservation.select(("restaurant_id , sum(payment_amount) as total_payment").where('extract(day   from date_column) = ?', desired_day_of_month).group("restaurant_id"))
      @records=[]
      @restaurants=Set.new
      time_slots.each do |ts|
        payments=ts.reservations.sum(:payment_amount)
        if @records[ts.restaurant_id].nil?
          @records[ts.restaurant_id]=0
        end
        @records[ts.restaurant_id]=@records[ts.restaurant_id]+payments
        @restaurants.add(ts.restaurant_id)
      end
    end

  end
  def print_report
    require 'set'
    @month=params[:month]
    time_slots=TimeSlot.where('extract(month from date) = ?', "#{@month}")
    # payments=Reservation.select(("restaurant_id , sum(payment_amount) as total_payment").where('extract(day   from date_column) = ?', desired_day_of_month).group("restaurant_id"))
    @records=[]
    @restaurants=Set.new
    time_slots.each do |ts|
      payments=ts.reservations.sum(:payment_amount)
      if @records[ts.restaurant_id].nil?
        @records[ts.restaurant_id]=0
      end
      @records[ts.restaurant_id]=@records[ts.restaurant_id]+payments
      @restaurants.add(ts.restaurant_id)
    end
    require "pdfkit"
    html=render_to_string(:action=>"print_report", :locals=>{:month=>@month})
    @kit  = PDFKit.new(html)

    @kit.to_file("hello.pdf")
    send_data @kit.to_pdf, :filename => "payments.pdf",
              :type => "application/pdf",
              :disposition  => "attachment", # either "inline" or "attachment"
              :page_size=>"letter"


    return
  end
  private

  def as_html
    render template: "admin/payments/print_report"

  end
end

