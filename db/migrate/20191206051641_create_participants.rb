class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.timestamps
      t.integer :participant_id
      t.references :event, index: true
    end
     add_foreign_key :participants, :events
  end
end
