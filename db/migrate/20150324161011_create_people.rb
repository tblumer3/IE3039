class CreatePeople < ActiveRecord::Migration
      def change
            create_table :people do |t|
                t.belongs_to :period
                t.string :description
                t.boolean :isFemale
                t.datetime :entry_time
                t.datetime :exit_time
            end
      end
end
