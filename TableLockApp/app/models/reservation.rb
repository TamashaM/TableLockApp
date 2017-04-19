class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :diner
  belongs_to :time_slot

  serialize :notification_params, Hash
  def paypal_url
    values = {
        business: "tablelockdine-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}",
        invoice: id,
        amount: 1,
        item_name: 'testItem',
        item_number: 'testNumber',
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
