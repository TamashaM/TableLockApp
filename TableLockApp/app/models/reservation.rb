class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :diner
  belongs_to :time_slot
  belongs_to :meal_type


  serialize :notification_params, Hash
  def paypal_url
    values = {
        business: "tablelockdine-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}",
        invoice: id,
        amount: 1,
        item_name: self.meal_type.title,
        item_number: self.meal_type.id,
        quantity: packs,
        notify_url: "http://540d38d3.ngrok.io/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
