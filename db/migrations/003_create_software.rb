Sequel.migration do 
  change do 
    create_table(:softwares) do 
      primary_key :id
      String :filename, unique: true
      String :name, unique: true
      String :details, text: true
    end
  end
end
