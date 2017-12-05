Sequel.migration do
  change do
    alter_table(:radios) do
      add_foreign_key :software_id, :softwares
    end
  end
end
