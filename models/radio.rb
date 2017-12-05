class Radio < Sequel::Model
  def software_nice_name
    software = Software.where(id: software_id).first
    return "" if software.nil?
    return software.name
  end
end
