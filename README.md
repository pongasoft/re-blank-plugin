RE Blank Plugin
===============

The goal of this project is to serve as an example for how to use the [re-cmake](https://github.com/pongasoft/re-cmake) Rack Extension CMake build framework.

This project is a fully buildable and functional Rack Extension which does nothing (the main function `renderBatch` is empty).

> #### Tip
> If you want to easily create a blank plugin check the [Rack Extension - Quick Start](https://pongasoft.com/re-quickstart/index.html) tool.

Requirements
------------

* This project requires CMake (minimum version 3.24) to be properly installed (`cmake` executable must be in your `PATH`)
* This project currently expects RE SDK 4.4.0 (arm64 support), 4.3.0 (Hi Res support), 4.2.0 or 4.1.0 to be installed on the machine (it will not download it for you)
* Due to the RE SDK requirements, this project also requires python 3 to be installed
* It has been tested on macOS Big Sur (11.7) / Xcode 13.2.1 (requires macOS 15+)
* It has been tested on macOS 12.6 / Xcode 13.3 installed and Apple Silicon (forces `x86_64` build to compile and run)
* It has been tested on Windows 10 with Visual Studio 16 2019 build tools + Clang toolchain

> #### Note
> For Windows, since re-cmake 1.6.0, the default setup is to use the Clang toolchain, for 2 main reasons:
>  * SIMD support out of the box (SIMD does not work without Clang)
>  * Use a similar compiler provided with the RE SDK
>
> Make sure you provision the build tools properly: using the Visual Studio Installer, select the "Individual components" tab, search for "clang" and make sure that "C++ Clang..." is selected (there may be more than one entry, so select all of them).
>
> ![Visual Studio Installer](https://github.com/pongasoft/re-cmake/releases/download/v1.6.0/Visual_Studio_Installer.png)
>
> If you want to disable the use of Clang (and revert to the behavior prior to v1.6.0), you can set the (CMake) option `RE_CMAKE_ENABLE_CLANG_TOOLCHAIN` to `OFF` before including `re-cmake` (and rerun `configure.py` after deleting the `build` folder).

### Note about the RE SDK location

You can install the SDK wherever you want on your system and provide it as an argument to the `configure.py` script. Or you can install (or create a link) in a default location:

* `/Users/Shared/ReasonStudios/JukeboxSDK_<RE_SDK_VERSION>/SDK` for macOS
* `C:/Users/Public/Documents/ReasonStudios/JukeboxSDK_<RE_SDK_VERSION>/SDK` for Windows

Also note that the `RE2DRender` program needs to be unzipped and is expected to be a sibling of `SDK` (can be changed as well).

> #### Note
> If you use CLion or other IDE handling CMake natively (and thus do not use the script), if you want to provide your own paths, you need to use the Settings/Preferences of the project to provide the right location to the `cmake` command line. If you are unsure about the syntax, you can always run the `configure.py` script in dry-run mode to see it:
> 
> ```
> python3 configure.py -n -p /my_path/to/sdk
> cmake "-B" "build" "-DRE_SDK_ROOT:PATH=/my_path/to/sdk" "-DCMAKE_BUILD_TYPE=Debug" "-G" "Unix Makefiles" "/.../re-blank-plugin"
> ```
>
> Another alternative is to simply modify the location directly in `CMakeLists.txt`

Quick Starting guide
--------------------

### Step 1 - Configure the build

Below, you will find several ways to configure the build. You can pick whichever you prefer:

- from the command line (using `configure.py`)
- using a GUI interface (`cmake-gui`)
- loading it directly in an IDE working natively with CMake (like CLion or Visual Studio Code)
- generating a project for Xcode or Visual Studio

#### Command line (`configure.py`)

Invoking the `configure.py` **creates** a `build` directory in the directory where the command is run. Although it is strongly recommended to run this command outside the source tree, the `build` directory is excluded in `.gitignore` and since everything is contained within the `build` folder it is easy to clean after the fact.

Running the `python3 configure.py -h` command will print the usage.

Note that depending on how `python` is installed on your system you may have to invoke it differently.

Note that this script is expecting the `cmake` command line tool to be in the path (use `cmake -version` to confirm it is properly installed).

```
# python3 ./configure.py -h
usage: configure.py [-h] [-n] [-f] [-R] [-p RE_SDK_ROOT] [-r RE_2D_RENDER_ROOT] [-G GENERATOR] [-- <cmake_options>]

positional arguments:
  cmake_options         Any options for cmake

optional arguments:
  -h, --help            show this help message and exit
  -n, --dry-run         Dry run (prints what it is going to do)
  -f, --force           Force a regeneration (delete and recreate build folder)
  -p RE_SDK_ROOT, --sdk-path RE_SDK_ROOT
                        Path to the sdk (optional)
  -r RE_2D_RENDER_ROOT, --render-path RE_2D_RENDER_ROOT
                        Path to RE2DRender (optional)
  -G GENERATOR, --generator GENERATOR
                        CMake generator (optional)
  -R, --release         Use CMake Release build type (for single-config generators)

Notes
  -p defaults to /Users/Shared/ReasonStudios/JukeboxSDK_<RE_SDK_VERSION>/SDK

  -r defaults to <path_to_sdk>/../RE2DRender

  -G defaults to "Unix Makefiles" on macOS and "Visual Studio 16 2019" / X64 for Windows10
  run 'cmake --help' to get the list of generators supported

  For single-config generators, Debug is used by default and can be changed with -R for Release
  For multi-config generators, -R is ignored

  To provide extra options to CMake you do it this way
  python3 configure.py -- -Wdev

Examples
  # Specify an explicit path to the sdk and uses default generator
  python3 configure.py -p /opt/local/JukeboxSDK_4.2.0/SDK

  # Use default sdk path and uses Xcode generator
  python3 configure.py -G Xcode

  # Use defaults
  python3 configure.py
```
> #### Note
> The default generator for macOS is "Unix Makefiles" (not Xcode) because it works really well and creates very fast builds.

#### `cmake-gui`

If you are more comfortable with a GUI rather than a command line interface (like `configure.py`) you can simply use `cmake-gui`. After setting the generator, select `Grouped` and look for the properties in the `RE` group. The most important ones are

```
RE_SDK_ROOT
RE_2D_RENDER_ROOT
RE_2D_RENDER_EXECUTABLE
RE_RECON_EXECUTABLE
```

#### CLion (by Jetbrains)

CLion understand CMake natively. So simply open the project in CLion. Note that CLion creates a `cmake-build-debug` folder in the source tree (also excluded in `.gitignore`) which can be changed under `Preferences / Build, Execution, Deployment / CMake / Generation Path`. Check the [notes](#note-about-the-re-sdk-location) section for how to change the paths if you don't install the SDK in its default location.  

> #### Note
> On Windows, make sure that in the `Settings / Build, Execution, Deployment / Toolchains` you have `Visual Studio` selected with an architecture `amd64`!

#### Xcode (macOS)

To create an Xcode project simply use the  `python3 configure.py -G Xcode` flavor. This will generate a `build/BlankPlugin.xcodeproj` project that you can open directly in Xcode.

#### Visual Studio Code (Windows)

This section assumes that you have CMake Tools extension installed (a Microsoft extension)

1. Open Folder

   Open the project by opening the folder containing the plugin

2. Configure CMake

   Click on the CMake Icon in the toolbar then click on ‘Configure’ icon at which point you will be prompted for a Kit. You should select “Visual Studio Build Tools 2019 - amd64”. This will configure CMake.

> #### Tip
> Visual Studio Code should show a notification that states: _"CMake Tools would like to configure IntelliSense for this folder"_. It is strongly recommended to allow the action to proceed as the various includes (like the ones related to the RE SDK) will automatically be properly resolved.

#### Visual Studio (Windows)

To create a Visual Studio project simply use the command line first and invoke `python3 configure.py` (on Windows the default generator is Visual Studio). This will generate a `build/BlankPlugin.sln` solution that you can open directly in Visual Studio.

### Step 2 - Install the plugin

#### Command line - `re.sh install`

After running the configure script, simply go into the newly generated `build` folder and run `re.sh` (resp. `re.bat`)

```
# cd build
# ./re.sh -h
usage: re.sh [-hnvlbdtRZ] <command> [<command> ...] [-- [native-options]]

positional arguments:
  command          See "Commands" section

optional arguments:
  -h, --help       show this help message and exit
  -n, --dry-run    Dry run (prints what it is going to do)
  -v, --verbose    Verbose build
  -l, --low-res    Forces low res build (4.3.0+)
  -b, --banner     Display a banner before every command
  -d, --debugging  Use 'Debugging' for local45 command
  -t, --testing    Use 'Testing' for local45 command
  -R, --release    Invoke CMake in Release mode (for multi-config generators)
  -Z               Clears the Recon Graphics Cache (workaround)

Commands
  ---- Native build commands ----
  build       : build the RE (.dylib)
  install     : build (code/gui) and install the RE for use in Recon
  test        : run the unit tests

  ---- Jbox build commands (build45 / sandbox toolchain) ----
  local45     : build (code/gui) and install the RE for use in Recon ('Deployment' type or -d/-t to change)
  universal45 : build the package for uploading to Reason Studio servers (.u45)
  validate45  : runs the Recon validate process on local45 (equivalent to ./re.sh local45 validate)

  ---- Common commands ----
  clean       : clean all builds
  render      : runs RE2DRender to generate the GUI (necessary for running in Recon)
  preview     : runs RE2DPreview to generate the device preview (useful for shop images)
  edit        : runs RE Edit to edit the device (UI)
  uninstall   : deletes the installed RE
  validate    : runs the Recon validate process on the currently installed plugin

  ---- CMake target ----
  <command>   : Any unknown <command> is treated as a cmake target

  --- Native options ----
  Pass remaining options to the native tool (ex: -- -j 8 for parallel build)
```

You should be able to simply run `re.sh install` (resp. `re.bat`) to have the plugin fully built and installed in its default location. 

#### IDEs - select a target and build

Select the `native-install` target/configuration and build it (Ctrl-F9 with CLion).

> #### Tip
> After the configure phase, the `re.sh` (resp. `re.bat`) script will be available in the build folder so you can also run any CLI command if you want even if you set up the project in the IDE.

### Step 3 - Try the plugin

You can then open Recon and load the `BlankPlugin` rack extension. You will find the plugin in the Effects section (the device type is set to `studio_fx` in `info.lua`) under the `pongasoft` vendor (the device manufacturer is set to `pongasoft` in `info.lua`).

> #### Note
> The plugin will **not** be accessible from Reason. You must use Recon. 
 
### Next Steps

You are now ready to explore further. If you are cloning this project to create your own Rack Extension, you should start by changing `info.lua`, but check the tip section below for a better alternative.

See section [Targets & Commands](https://github.com/pongasoft/re-cmake#targets--commands) for details on the various commands related to the build.

> #### Tip
> If you want to easily create a blank plugin check the [Rack Extension - Quick Start](https://pongasoft.com/re-quickstart/index.html) tool.

### A note about debug logging

This example project uses `re-logging` for debug logging, to demonstrate that it is possible to use a library that does not compile when doing _jbox_ builds but compiles when doing _native_ builds. In addition, `re-logging` has a lot of features, like `DCHECK_F` to do sanity checks, various levels of logging, etc...

You do not have to use it in your own project and can use `JBOX_TRACE` and other flavors provided by the SDK but note the following:

- if you do a native build, `JBOX_TRACE` (and `re-logging`) will be enabled only if the option `ENABLE_DEBUG_LOGGING` is provided to `add_re_plugin` as is the case in this example, so it is easy to turn off debug logging if you desire
- `re-logging` is always disabled for jbox builds (because it cannot compile with jbox builds)
- `JBOX_TRACE` is enabled or disabled in jbox builds following the rules implemented in the SDK. The rules are:
  - for 'local45 Debugging' (`./re.sh -d local45`) `JBOX_TRACE` is enabled
  - for 'local45 Testing' (`./re.sh -t local45`) `JBOX_TRACE` is enabled
  - for 'local45 Deployment' (`./re.sh local45`) `JBOX_TRACE` is disabled
  - for 'universal45' (`./re.sh universal45`), it produces a zip file containing 2 builds, a `Testing` build for which `JBOX_TRACE` is enabled and a `Deployment` build for with `JBOX_TRACE` is disabled

Release notes
-------------
#### 1.8.5 - 2025/08/17

- `re-cmake` 1.8.5, `re-mock` 1.8.1 (Fixes issue with `JBOX_TRACE` called from destructor)

#### 1.8.4 - 2025/08/16

- `re-cmake` 1.8.4, `re-logging` 2.0.2 (the device can now be deleted/undo in Recon 
  when the code is changed/recompiled without having to restart Recon)

#### 1.8.0 - 2024/12/21

- `re-cmake` 1.8.0 (patch metadata support), SDK 4.6.0

#### 1.7.3 - 2024/10/08

- `re-cmake` 1.7.3, `re-mock` 1.7.0, `re-logging` 1.0.2, SDK 4.5.0

#### 1.7.2 - 2024/06/20

- `re-cmake` 1.7.2, `re-mock` 1.6.0

#### 1.7.0 - 2023/07/03

- Use SDK 4.4.0, `re-cmake` 1.7.0, `re-mock` 1.5.0

#### 1.6.1 - 2023/04/28

- Use `re-cmake` 1.6.1, `re-mock` 1.4.2, `re-logging` 1.0.1
- Make sure that re-mock throws an exception when something is wrong
- Uses url hashes to harden the build

#### 1.5.0 - 2023/01/15

- Use `re-cmake` 1.5.0, `re-mock` 1.3.2, `re-logging` 1.0.1
- Use [RE Edit](https://pongasoft.com/re-edit/index.html) for UI editing (introduced `GUI2D/gui_2D.cmake`)
- Use better (= built-in) graphics for device name and sockets

#### 1.4.1 - 2022/01/24

- Use `re-cmake` 1.4.2.
- Use `re-mock` 1.0.0 for testing.

#### 1.4.0 - 2021/09/012

- Use `re-cmake` 1.3.4.
- Use `re-mock` 0.9.0 for testing.
- Fixed `realtime_controller.lua` after unit test uncovered wrong name!


#### 1.3.1 - 2021/07/05

- Use `re-cmake` 1.3.1.
- Use static library for testing

#### 1.3.0 - 2021/07/04

- Use `re-cmake` 1.3.0.
- Added unit test to demonstrate the feature

#### 1.2.0 - 2021/01/25

- Use `re-cmake` 1.2.0.
- Builds properly on Apple chipset

#### 1.1.0 - 2020/09/21

- Use `re-cmake` 1.1.0.

#### 1.0.1 - 2020-09-04

- Use `re-cmake` 1.0.1

#### 1.0.0 - 2020-06-18

- First release.

Licensing
---------

- This project is released under the terms of the [Apache 2.0 license](LICENSE.txt)

- This project uses the Rack extension SDK released under the [Rack Extension License agreement](RE_License.txt)
