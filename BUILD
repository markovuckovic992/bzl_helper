load("//:macro.bzl", "custom_rule_tes", "custom_coverage")

cc_binary(
	name="main",
	srcs=["main.cpp"],
	linkopts=["--coverage"],
	copts=["--coverage"]
)

py_test(
	name="test_",
	srcs=["simple_test.py"],
	imports=["utils.fixtures.fixtures"],
	main="simple_test.py",
	data=[":main", "//utils/fixtures:fixtures.py", "//utils:copy_util.py"],
)

custom_rule_tes(
	name = "test_runner",
	target = ":test_",
	binaries = ["main"],
	testonly = True,
)

sh_binary(
	name="shell_test_script",
	srcs=["shell_test_script.sh"]
)

custom_coverage(
	name = "coverage_binary",
	srcs = ["test_runner"],
	testonly = True,
)