class CreateGeeePayNotices < ActiveRecord::Migration
  def self.up
    create_table :geee_pay_notices do |t|
      t.string  :version_id
      t.string :trans_type
      t.string :asyn_notify_url
      t.string :syn_notify_url
      t.string :mer_id
      t.string :order_amount
      t.string :prd_ord_no
      t.string :order_status
      t.string :pay_id
      t.string :pay_time
      t.string :sign_type
      t.string :mer_param
      t.string :sign_data
      t.timestamps
    end
  end

  def self.down
    drop_table :geee_pay_notices
  end
end