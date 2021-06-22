class CreateAnimals < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.string     :animal_name,     null: false
      t.integer    :animal_type_id,  null: false
      t.string     :animal_pedigree, null: false
      t.date       :birthday,        null: false
      t.text       :introduction,    null: false
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
