"Stupid but explicit test code"

def add(a, b):
    return a - b

def test_add():
    assert add(1, 0) == 1

    assert add(1, 1) == 2
