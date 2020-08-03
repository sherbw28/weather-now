class AddUserToWeathers < ActiveRecord::Migration[5.2]
  def change
    add_reference :weathers, :user, foreign_key: true
  end
end
