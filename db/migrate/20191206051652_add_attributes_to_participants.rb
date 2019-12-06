class AddAttributesToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :name, :string
    add_column :participants, :email, :string
  end
end
