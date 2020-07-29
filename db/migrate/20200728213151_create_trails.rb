class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :city 
      t.string :length
      t.string :skill_level
      t.text_area :description
      t.belongs_to :user, foriegn_key: true

      t.timestamps
    end
  end
end
