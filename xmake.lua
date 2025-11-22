set_project("FMMTL")
-- set_languages("cxx11")

add_rules("mode.debug", "mode.release")

add_requires("openmp")

target("fmmtl")
    set_kind("headeronly")
    add_packages("openmp")

    add_includedirs("/", "/kernel/", {public = true})
    add_includedirs("thrust", {public = true})

    add_headerfiles("fmmtl/**.hpp", "fmmtl/**.inl")
    add_headerfiles("kernel/**.hpp", "kernel/**.kern")

target("compiles")
    set_kind("binary")
    add_deps("fmmtl")
    add_packages("openmp")

    add_files("unit_tests/compiles.cpp")

target("error_laplace")
    set_kind("binary")
    add_deps("fmmtl")
    add_packages("openmp")

    add_files("examples/error_laplace.cpp")