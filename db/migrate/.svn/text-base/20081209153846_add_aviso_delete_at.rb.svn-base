class AddAvisoDeleteAt < ActiveRecord::Migration
  def self.up
    change_table :avisos do |t|
       t.date :deleted_on
    end
  end

  def self.down
   change_table :avisos do |t|
      t.remove :delete_on
    end
  end
end
