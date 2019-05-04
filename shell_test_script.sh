cd "/workspace" || cd "/home/marko/macro_test"
WS=$(pwd)
mkdir -p /tmp/bazel_out
{
	--output_user_root=/tmp/bazel_out test //:test_ \
	--action_env=WS="$WS" --linkopt="--coverage" \
	--copt="--coverage" --sandbox_debug 2> /dev/null
} || {
bazel --output_user_root=/tmp/bazel_out test //:test_ \
		--action_env=WS="$WS" --linkopt="--coverage" \
		--copt="--coverage" --sandbox_debug
}
find /tmp/bazel_out | grep .gcno