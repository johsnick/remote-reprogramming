import sys
import ctypes
import sys

import top_block

signal.signal(signal.SIGTERM, killhandle)

def main(ip_addr, file_location, type, appDir, additional_args = ""):
	response = os.system("ping -c 1 " + ip_addr)

	if(response <= 0):
		print "Could not connect"
		return -10

	if sys.platform.startswith('linux'):
		try:
			x11 = ctypes.cdll.LoadLibrary('libX11.so')
			x11.XInitThreads()
		except:
			print "Warning: failed to XInitThreads()"

	tb = top_block_cls(uhd_args)
	tb.Start(True)
	tb.Wait()

def killhandle(signum, frame):
     ''' This will close connections cleanly '''
    line = "SIGTERM detected, shutting down"
    syslog.syslog(syslog.LOG_INFO, line)
    rdb_server.close()
    syslog.closelog()
    sys.exit(0)


if __name__ == '__main__':
	main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
