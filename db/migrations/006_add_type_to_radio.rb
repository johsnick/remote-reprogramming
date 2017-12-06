Sequel.migration do
  change do
    alter_table(:radios) do
      add_column :radioType, String, default: nil
    end
  end
end