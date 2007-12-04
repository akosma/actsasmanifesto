class CreateManifesto < ActiveRecord::Migration
  def self.up
    create_table :manifestos do |t|
      t.column :title,            :string,  :limit => 50
      t.column :author,           :string,  :limit => 50
      t.column :email,            :string,  :limit => 50
      t.column :description,      :text
      t.column :signatures_count, :integer, :default => 0
      t.column :created_at,       :datetime
      t.column :updated_at,       :datetime
    end

    create_table :signatures do |t|
      t.column :manifesto_id,   :integer
      t.column :name,           :string,  :limit => 50
      t.column :email,          :string,  :limit => 50
      t.column :age,            :integer
      t.column :country,        :string,  :limit => 50
      t.column :comment,        :text
      t.column :email_privacy,  :string,  :limit => 1, :default => "i"
      t.column :created_at,     :datetime
      t.column :updated_at,     :datetime
    end
    
    @manifesto = Manifesto.create({ 
      :title => "Save the whales!", 
      :author => "John Doe",
      :email => "john@doe.com",
      :description => "You must save the whales now!"
    })
    
    Signature.create({
      :manifesto => @manifesto,
      :name => "Roger Smith",
      :email => "roger@smith.com",
      :age => 45,
      :country => "Planet Earth",
      :comment => "You are right! We must do something",
      :email_privacy => "i"
    })
  end

  def self.down
    drop_table :manifestos
    drop_table :signatures
  end
end
