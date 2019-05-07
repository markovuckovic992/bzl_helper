load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
  name = "bazel_toolchains",
  sha256 = "67335b3563d9b67dc2550b8f27cc689b64fadac491e69ce78763d9ba894cc5cc",
  strip_prefix = "bazel-toolchains-cddc376d428ada2927ad359211c3e356bd9c9fbb",
  urls = [
    "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/cddc376d428ada2927ad359211c3e356bd9c9fbb.tar.gz",
    "https://github.com/bazelbuild/bazel-toolchains/archive/cddc376d428ada2927ad359211c3e356bd9c9fbb.tar.gz",
  ],
)

skylib_version = "0.8.0"
http_archive(
    name = "bazel_skylib",
    type = "tar.gz",
    url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib.{}.tar.gz".format (skylib_version, skylib_version),
    sha256 = "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
)