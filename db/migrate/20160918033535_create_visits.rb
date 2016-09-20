Sequel.migration do
  change do

    create_table :visits do
      primary_key :id
      String :url, :null=>false
      String :referrer
      DateTime :created_at, :null=>false
      String :hash, :null=>false
    end

  end
end
