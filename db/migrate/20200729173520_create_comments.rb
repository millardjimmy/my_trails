class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :reply
      t.belongs_to :user, foreign_key: true
      t.belongs_to :trail, foreign_key: true 

      t.timestamps
    end
  end
end
