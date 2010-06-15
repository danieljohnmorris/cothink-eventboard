class AddPublishFlagToEvents < ActiveRecord::Migration
  def self.up
    change_table "events" do |t|
      t.string :publish_state
    end
  end

  def self.down
    change_table "events" do |t|
      t.remove :publish_state
    end
  end
end
