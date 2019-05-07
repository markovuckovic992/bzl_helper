load("@bazel_skylib//lib:paths.bzl", "paths")

def py_test_runner(ctx):
    outputs = []
    #for file in ctx.attr.target[DefaultInfo].data_runfiles.files:
    #    if not file.is_source and \
    #        ctx.executable.target.basename != file.owner.name:
    #            outputs.append(ctx.actions.declare_file(
    #                "{}.pic.gcno".format(file.owner.name)
    #            ))
    #            outputs.append(ctx.actions.declare_file(
    #                "{}.pic.gcda".format(file.owner.name)
    #            ))
    for binary in ctx.attr.binaries:
        outputs.append(ctx.actions.declare_file(
            "{}.pic.gcno".format(binary)
        ))
        outputs.append(ctx.actions.declare_file(
            "{}.pic.gcda".format(binary)
        ))

    ctx.actions.run(
        outputs=outputs,
        inputs=ctx.files.target,
        executable=ctx.executable.target,
        use_default_shell_env=True,
    )

    return DefaultInfo(
        files=depset(outputs)
    )


custom_rule_tes = rule(
    implementation = py_test_runner,
    attrs = {
        "target": attr.label(executable=True, cfg="target", mandatory=True),
        "binaries":  attr.string_list(mandatory=True, allow_empty=False),
    },
)


def custom_coverage_impl(ctx):
    for file in ctx.attr.srcs[0].files:
        location = file.root.path

    path = " /home/marko/.cache/bazel/_bazel_marko/13c07021545910c3523bc1f465f409a4/execroot/__main__/{}".format(location)
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