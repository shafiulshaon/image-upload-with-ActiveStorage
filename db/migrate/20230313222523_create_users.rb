class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      t.string :user_id,         null: false, comment: 'ユーザーID'
      t.string :password_digest, null: false, comment: 'パスワード'

      t.timestamps null: false
    end
  end
end
