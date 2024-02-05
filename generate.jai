#import "Bindings_Generator";
#import "Basic";
#import "File";
#import "String";
#import "BuildCpp";
#import "File_Utilities";

#run {
    using opts: Generate_Bindings_Options;
    array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);

    array_add(*libpaths, "win");
    array_add(*libnames, "glfw3");
    array_add(*include_paths, "glfw-3.3.9/include/");
    files := file_list(tprint("%glfw-3.3.9/include/", #filepath), true);
    for file: files {
        if !ends_with(file, ".h") {
            continue;
        }

        print("%\n", file);
        array_add(*source_files, file);
    }

    generate_compile_time_struct_checks = false;

    generate_bindings(opts, "module.jai");
}
