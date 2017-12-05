class RRPG
  def reprogram(radioId) do
    r = Radio.where(radio_id: radioId)

    # Process is currently running
    if r.pid > 0
      Process.kill('TERM', r.pid)
    end

    # if we want to copy log files out to the DB we need to do it here.
    # Otherwise, we are gonna overwrite them on the Process.spawn

    _filePath = " ./var/tmp/"+r.name.parameterize.underscore

    _rrpgArgs = _filePath + " " + r.ip + " " + r.type

    r.pid = Process.spawn(("python rrpg " + _rrpgArgs))

    r.save
  end
end