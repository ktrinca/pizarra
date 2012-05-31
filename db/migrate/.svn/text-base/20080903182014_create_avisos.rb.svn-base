class CreateAvisos < ActiveRecord::Migration
  def self.up
    create_table :avisos do |t|
      t.text :contenido
      t.references :pizarra

      t.timestamps
    end
  end

  def self.down
    drop_table :avisos
  end
end
