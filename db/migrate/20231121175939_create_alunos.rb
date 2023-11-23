class CreateAlunos < ActiveRecord::Migration[7.1]
  def change
    create_table :alunos do |t|

      t.timestamps
    end
  end
end
