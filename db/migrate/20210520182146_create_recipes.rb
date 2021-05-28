class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :author
      t.string :keywords
      t.string :metadata
      t.string :main_img
      t.string :title
      t.string :description
      t.string :ingriedients
      t.string :instructions
      t.string :instruction_imgs
      t.string :tips 
      t.timestamps
    end
  end
end
