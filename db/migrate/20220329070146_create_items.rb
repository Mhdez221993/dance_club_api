class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :picture,      null: false, default: "https://www.kindpng.com/picc/m/22-226207_ballroom-and-latin-dance-lessons-for-adults-la.png"
      t.string :name,         null: false, default: ""
      t.string :description,  null: false, default: ""
      t.integer :finance,      null: false, default: 0
      t.integer :option,       null: false, default: 0
      t.float :total,        null: false, default: 0
      t.integer :duration,    null: false, default: 0
      t.float :apr,          null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
