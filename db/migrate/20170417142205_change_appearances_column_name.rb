class ChangeAppearancesColumnName < ActiveRecord::Migration[5.0]
  def up
    change_table :appearances do |t|
      t.rename :episdoe_id, :episode_id
    end
  end
  
  def down
    change_table :appearances do |t|
      t.rename :episode_id, :episdoe_id
    end
  end
end
