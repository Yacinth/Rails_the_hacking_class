class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.belongs_to :course
      t.string :name

      t.timestamps
    end
  end
end
