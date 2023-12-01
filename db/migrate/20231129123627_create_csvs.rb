class CreateCsvs < ActiveRecord::Migration[7.1]
  def change
    create_table :csvs do |t|

      t.timestamps
    end
  end
end
