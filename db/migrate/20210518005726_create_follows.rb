class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :user
      t.references "following"
      t.timestamps
    end
  end
end
