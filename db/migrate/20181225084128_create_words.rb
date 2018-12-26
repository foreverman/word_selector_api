class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :spelling

      t.timestamps
    end

    add_index :words, :spelling, unique: true
    add_index :words, :spelling, name: :words_on_spelling_gin_trgm_idx,
      using: :gin, opclass: {spelling: :gin_trgm_ops}
  end
end
