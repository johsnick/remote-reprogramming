import sys

def main(ip_addr, file_location):
	response = os.system("ping -c 1 " + ip_addr)
	
	if(response <= 0):
		return -10

	



if __name__ == '__main__':
	main()