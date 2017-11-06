import sys
import ctypes
import sys

import top_block



def main(ip_addr, file_location, type, additional_args = ""):
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

if __name__ == '__main__':
	main('192.168.0.1', '/file_location', 'n210')