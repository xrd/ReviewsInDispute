class AddVote < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.timestamps
      t.string :ip
      t.string :choice
    end
  end

  def down
    drop_table :votes
  end
end
