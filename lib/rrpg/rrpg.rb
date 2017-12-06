class RRPG

  def self.reprogram(id)
    radio = Radio[id]
    puts "RadioID: " + radio.name

    # Process is currently running
    if radio.pid > 0
      Process.kill('TERM', radio.pid)
    end

    # if we want to copy log files out to the DB we need to do it here.
    # Otherwise, we are gonna overwrite them on the Process.spawn

    path = " radios/"+radio.id

    args = path + " " + radio.ip + " " + radio.radio_type + " " "software/#{r.filename}"

    radio.pid = Process.spawn(("python rrpg " + args))

    radio.save
  end

  def self.reprogram_batch(radios)
    radios.each &self.method(:reprogram)
  end
end