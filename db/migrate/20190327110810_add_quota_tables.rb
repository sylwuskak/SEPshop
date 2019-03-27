class AddQuotaTables < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t| 
      t.string :user_name, null: false
      t.string :user_password, null: false
      t.string :user_email, null: false
      t.string :user_phone_number, null: false
      t.float :total_cost

      t.timestamps
    end

    create_table :product_types do |t|
      t.string :pr_type, null: false
      t.string :name, null: false
      t.float :price, null: false
    end

    create_table :products do |t|
      t.string :type, null: false
      t.float :price, null: false

      #subscription
      t.date :start_date
      t.date :end_date

      #service
      t.integer :start_time
      t.integer :end_time 
      t.integer :day_of_week
      t.integer :number_of_weeks

      #goods
      t.integer :number

      t.references :product_type, null: false
      t.references :order, null: false
    end
  end
end
