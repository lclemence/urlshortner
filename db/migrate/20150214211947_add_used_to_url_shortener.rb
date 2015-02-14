class AddUsedToUrlShortener < ActiveRecord::Migration
  def change
    add_column :url_shorteners, :used, :integer, default: 0
  end
end
