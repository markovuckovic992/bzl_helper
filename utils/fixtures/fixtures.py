import pytest

@pytest.fixture
def widget():
	w = {
		"width": 24,
	}
	return w