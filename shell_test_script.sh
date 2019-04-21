OUT_BASE="/home/marko/.cache/bazel/_bazel_marko/13c07021545910c3523bc1f465f409a4"
cd "/home/marko/macro_test"
bazel test //:test_ --test_output=streamed --cache_test_results=no --sandbox_debug --action_env=OUT_BASE="$OUT_BASE"
