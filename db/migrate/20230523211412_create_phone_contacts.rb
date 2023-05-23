class CreatePhoneContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_contacts do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone

      t.timestamps
    end
  end
end
