class AddUser < ActiveRecord::Migration
  def self.up
    User.reset_column_information
    usr = User.create(:login => "default", 
                :email => "yraspo@gmail.com",
                :password => "plokijuh",
                :password_confirmation => "plokijuh")
    usr.activate!             
   end

  def self.down
    User.find_by_email("yraspo@gmail").destroy
  end

end
