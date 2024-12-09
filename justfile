# -*- mode: just -*-

# Define project directory
#
# {Project, Manifest}.toml should exist in the root directory, as per
# the justfile, so we should be able to use the justfile directory [1]
# as the root project directory that Julia uses.
#
# [1]: https://just.systems/man/en/functions.html#justfile-and-justfile-directory
project_dir := justfile_dir() / "/"
test_dir := project_dir / "test/"
test_file := test_dir / "runtests.jl"
standard_instantiate_code := """
import Pkg
Pkg.instantiate()
"""

# Test project
test:
    julia --project={{project_dir}} {{test_file}}

# Check formatting with blue style
[group: 'ci']
fmt: install-formatter
    # https://github.com/invenia/BlueStyle
    julia --project=@JuliaFormatter -e 'using JuliaFormatter; format("{{project_dir}}", style=BlueStyle())'

# Install JuliaFormatter
[private]
install-formatter:
    julia --project=@JuliaFormatter -e 'import Pkg; Pkg.add("JuliaFormatter")'

