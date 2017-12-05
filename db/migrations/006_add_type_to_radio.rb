Sequel.migration do
  change do
    alter_table(:radios) do
      add_column :type, :String
    end
  end
end