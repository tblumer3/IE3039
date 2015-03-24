class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.string :title
      t.datetime :time_start
      t.datetime :time_end
    end
  end
end
