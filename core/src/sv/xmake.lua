set_warnings("all", "error")

if is_os("macosx") or is_os("ios") then
    add_cflags("-Wno-nullability-completeness")
    add_cxxflags("-Wno-nullability-completeness")
end

if is_mode("release") then
    set_symbols("hidden")
    set_optimize("fastest")
    set_strip("all")
end

if is_mode("debug") then
    set_symbols("debug")
    set_optimize("none")
end

target("sv")
    set_default(true)
    set_languages("c99")
    set_kind("$(kind)")
    add_headerfiles("include/(*.h)")
    add_headerdirs("include")
    add_includedirs("include")
    add_files("src/*.c")

includes("test")
