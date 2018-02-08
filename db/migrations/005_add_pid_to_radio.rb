Sequel.migration do
  change do
    alter_table(:radios) do
      add_column :pid, Integer, default: -1
    end
  end
end