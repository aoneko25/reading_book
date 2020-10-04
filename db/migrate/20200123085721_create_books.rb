class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :user             , optional: true
      t.integer     :item_id                    
      t.string      :visibility      
      t.string      :genre           
      t.string      :title           , null: false
      t.string      :subtitle
      t.string      :language        
      t.string      :author          
      t.string      :the_publisher   
      t.date      :issue_date      
      t.integer     :page_number     
      t.string      :format          
      t.text        :overview        
      t.string     :chapter         
      t.string     :volume          
      t.string     :episode         
      t.date        :read_day        
      t.text        :impression      

      t.timestamps null: true
    end
  end
end
