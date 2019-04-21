def py_test_runner(ctx):
    test_gcno = ctx.actions.declare_file(
        "main.pic.gcno"
    )

    test_gcda = ctx.actions.declare_file(
        "main.pic.gcda"
    )

    ctx.actions.run(
        outputs=[test_gcno, test_gcda],
        inputs=ctx.files.target,
        executable=ctx.executable.target,
        use_default_shell_env=True,
    )

    return DefaultInfo(
        files=depset([test_gcno, test_gcda])
    )


custom_rule_tes = rule(
    implementation = py_test_runner,
    attrs = {
        "target": attr.label(executable=True, cfg="target", mandatory=True),
    },
)


def custom_coverage_impl(ctx):
    path = " /home/marko/.cache/bazel/_bazel_marko/13c07021545910c3523bc1f465f409a4/execroot/__main__/bazel-out/k8-fastbuild/bin/"
    cmd = "geninfo {} -o out.info && ".format(path)
    cmd += "genhtml out.info -o html"

    cov_cmd = ctx.actions.declare_file("cov_cmd")
    ctx.actions.write(cov_cmd, cmd, is_executable=True)

    ctx.actions.run_shell(
        inputs=ctx.files.srcs,
        outputs=[ctx.outputs.log],
        command="touch {}".format(ctx.outputs.log.path),
    )

    return DefaultInfo(
        executable=cov_cmd,
    )


custom_coverage = rule(
    implementation = custom_coverage_impl,
    executable = True,
    attrs = {
        "srcs": attr.label_list(),
    },
    outputs = {"log": "log.txt"},
)