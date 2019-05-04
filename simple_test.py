import sys
from utils.fixtures.fixtures import *
import os, subprocess
from time import sleep
from utils.copy_util import copytree

def test_add_001(widget):
	assert widget.get("width") == 24

def test_add_002():
	ws = os.environ['WS']
	data = subprocess.Popen('{}/bazel-bin/main'.format(ws), stdout=subprocess.PIPE).communicate()[0]
	print(data)

if __name__ == '__main__':
	ret = pytest.main(['-s', __file__])
	# print("-----")
	# for root, dirs, files in os.walk(os.environ['OUT_BASE']):
	# 	level = root.replace(os.environ['OUT_BASE'], '').count(os.sep)
	# 	indent = ' ' * 4 * (level)
	# 	print('{}{}/'.format(indent, os.path.basename(root)))
	# 	subindent = ' ' * 4 * (level + 1)
	# 	for f in files:
	# 		print('{}{}'.format(subindent, f))
	# print("-----")
	# os.system("cp /home/marko/main.pic.gcno /home/marko/macro_test/bazel-bin/")
	# os.system("cp /home/marko/main.pic.gcda /home/marko/macro_test/bazel-bin/")
	#copytree("/home/marko/macro_test/bazel-out/host/bin/", "/home/marko/macro_test/bazel-bin/bazel-out/host/bin/")
	sys.exit(ret)
