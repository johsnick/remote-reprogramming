Sequel.migration do
  change do
    # alter_table(:radios) do
      add_foreign_key :radios, :softwares
    # end
  end
end
