class AddLocationToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_column :weathers, :location, :string
  end
end
