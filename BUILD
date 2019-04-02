load("//:macro.bzl", "py_run_test", "sctf_py_tes")

cc_binary(
	name="main",
	srcs=["main.cpp"],
    tags=["no-cache"],
    stamp=1,
)

py_test(
	name="test_",
	srcs=["simple_test.py"],
	main="simple_test.py",
	data=[":main"],
    stamp=1,
)

sh_test(
	name="coverage_runner",
	srcs=["coverage_runner.sh"],
    tags=["no-cache"],
)
