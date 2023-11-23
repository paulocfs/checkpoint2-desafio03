class CreateSemestres < ActiveRecord::Migration[7.1]
  def change
    create_table :semestres do |t|

      t.timestamps
    end
  end
end
