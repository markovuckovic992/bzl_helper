import sys
import pytest
from util import list_files

@pytest.fixture
def widget():
	w = {
		"width": 24,
	}
	return w

def test_add_001(widget):
	assert widget.get("width") == 24

def test_add_002():
	pass
	# print("-----------")
	# list_files("/home/marko/.cache/bazel/_bazel_marko/13c07021545910c3523bc1f465f409a4/sandbox")
	# print("-----------")
	

if __name__ == '__main__':
	sys.exit(pytest.main(['-s', __file__]))
