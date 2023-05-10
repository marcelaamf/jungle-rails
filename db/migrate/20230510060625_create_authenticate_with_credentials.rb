class CreateAuthenticateWithCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :authenticate_with_credentials do |t|

      t.timestamps
    end
  end
end
