echo "-----------"
WORKSPACE=$1
echo $WORKSPACE
echo "-----------"
#cov_folder="/home/marko/.cache/bazel/tmp"
cov_folder="$HOME/coverage"
result_folder="$HOME/res"

rm -rf "$cov_folder"
mkdir -p "$cov_folder"

rm -rf "$result_folder"
mkdir -p "$result_folder"

cd "$WORKSPACE"
bazel --output_base="$cov_folder" test //:test_ --cache_test_results=no --sandbox_debug --copt="-ftest-coverage"

cd "$cov_folder"
find . -name \*.gcno -exec cp {} "$result_folder" \;
cd "$result_folder"

rm -rf "$cov_folder"
ls
