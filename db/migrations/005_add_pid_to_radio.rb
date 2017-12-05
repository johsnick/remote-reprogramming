Sequel.migration do
  change do
    alter_table(:radios) do
      add_column :pid, :Int
    end
  end
end