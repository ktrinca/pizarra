class AddPizarraUserId < ActiveRecord::Migration
  def self.up
    change_table :pizarras do |t|
       t.belongs_to :user # esto agrega la columna goat_id (integer)
    end

  end

  def self.down
    change_table :pizarras do |t|
      t.remove_belongs_to :user
    end
  end
end
