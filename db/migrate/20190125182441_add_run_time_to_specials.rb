class AddRunTimeToSpecials < ActiveRecord::Migration[5.2]
  def change
    add_column :specials, :run_time, :integer
  end
end
