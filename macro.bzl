def py_run_test(name, script_name):
    native.py_test(
        name = script_name[:-3],
        srcs = [script_name],
        data = ["util.py"],
    )

    native.py_test(
        name = "python_script",
        srcs = ["python_script.py"],
        data = ["util.py"],
    )

def _impl_sctf_py_test(ctx):
    out = ctx.actions.declare_file("out.txt")
    ctx.actions.run(
        executable=ctx.executable.target,
        outputs = [out],
    )


sctf_py_tes = rule(
    implementation = _impl_sctf_py_test,
    attrs = {
        "target": attr.label(executable=True, cfg="target"),
    },
)
