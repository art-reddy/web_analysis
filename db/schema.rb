Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:visits) do
      primary_key :id, :type=>"int(11)"
      column :url, "varchar(255)", :null=>false
      column :referrer, "varchar(255)"
      column :created_at, "datetime", :null=>false
      column :hash, "varchar(255)", :null=>false
    end
  end
end
Sequel.migration do
  change do
    self << "INSERT INTO `schema_migrations` (`filename`) VALUES ('20160918033535_create_visits.rb')"
  end
end
