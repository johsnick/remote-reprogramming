Sequel.migration do 
  change do
    create_table(:radios) do 
      primary_key :id
      String :name
      String :ip
      Integer :pid
    end
  end
end