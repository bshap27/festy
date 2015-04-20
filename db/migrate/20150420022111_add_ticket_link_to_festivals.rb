class AddTicketLinkToFestivals < ActiveRecord::Migration
  def change
    add_column :festivals, :ticket_link, :string
  end
end
