class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images, comment: '写真' do |t|
      t.string     :title, null: false, comment: 'タイトル'
      t.references :user,  null: false, foreign_key: true, comment: 'ユーザーID', index: true

      t.timestamps null: false
    end
  end
end
