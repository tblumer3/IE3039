class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :title
      t.datetime :time_start
      t.datetime :time_end
    end
  end
end
