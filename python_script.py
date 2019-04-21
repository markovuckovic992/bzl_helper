from utils.copy_util import copytree

def main():
	print("-----+-----")
	do_the_copy("bazel-out/host/bin/", "bazel-bin/bazel-out/host/bin/")
	print("-----+-----")


if __name__ == '__main__':
	main()
