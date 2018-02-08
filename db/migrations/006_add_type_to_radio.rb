Sequel.migration do
  change do
    alter_table(:radios) do
      add_column :radio_type, String, default: nil
    end
  end
end