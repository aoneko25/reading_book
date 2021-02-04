class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user             , optional: true
      t.string      :self_introduction
      t.string      :dream
      t.string      :terget
      t.date      :scheduled_date
      t.string      :plan
      t.string      :favorite_book
      t.string      :recommended_book
      t.string      :hobby
      t.string      :forte
      t.string      :weak_point
      t.string      :icon

      t.timestamps
    end
  end
end
