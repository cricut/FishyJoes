import testapi

def pytest_sessionfinish(session, exitstatus):
    testapi._native.log_handles()
