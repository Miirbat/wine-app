class CreateWineTable < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :vintage
      t.string :varietal
      :t.string

      t.timestamps
    end
  end
end
