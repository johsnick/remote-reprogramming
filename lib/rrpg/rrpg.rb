class RRPG

  def self.reprogram(radio, software)
    puts "RadioID: " + radio.name

    # Process is currently running
    if radio.pid > 0
      begin
        Process.kill('TERM', radio.pid)
      rescue => e 
        radio.pid = -1
      end
    end

    # if we want to copy log files out to the DB we need to do it here.
    # Otherwise, we are gonna overwrite them on the Process.spawn

    path = " radios/#{radio.id}"
    args = "#{path} #{radio.ip} #{radio.radio_type} software/#{software.filename}"

    puts args

    begin
      radio.pid = Process.spawn("python lib/rrpg/rrpg.py #{args}")
    rescue => e
      radio.pid = -1
      raise e
    end

    radio.save
  end

  def self.reprogram_batch(radios, software)
    radios.each do |radio|
      reprogram(radio, software)
    end
  end
end