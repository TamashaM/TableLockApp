class AlterReservationTable < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :payment_amount, :float
  end
end
