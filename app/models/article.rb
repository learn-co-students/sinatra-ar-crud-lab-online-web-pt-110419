#Placeholder for a model

class Article < ActiveRecord::Base
  def change 
    create_table :article do 
      t.string :title 
    end 
  end 
end