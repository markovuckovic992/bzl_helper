from util import list_files, do_the_copy

def main():
	print("-----+-----")
	do_the_copy("test-setup.sh", "/home/marko")
	print("-----+-----")


if __name__ == '__main__':
	main()
