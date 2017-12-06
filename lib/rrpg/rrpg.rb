class RRPG

  def reprogram(_radioID)




    r = Radio.where(radio_id: _radioID)
    puts "RadioID: " + r.name

    # Process is currently running
    if r.pid > 0
      Process.kill('TERM', r.pid)
    end

    # if we want to copy log files out to the DB we need to do it here.
    # Otherwise, we are gonna overwrite them on the Process.spawn

    _filePath = " radios/"+r.id

    _rrpgArgs = _filePath + " " + r.ip + " " + r.radioType + " " "software/#{r.filename}"

    r.pid = Process.spawn(("python rrpg " + _rrpgArgs))

    r.save
  end

end