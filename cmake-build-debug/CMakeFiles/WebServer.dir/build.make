# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/julian/Desktop/Project/server

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/julian/Desktop/Project/server/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/WebServer.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/WebServer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/WebServer.dir/flags.make

CMakeFiles/WebServer.dir/Channel.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/Channel.o: ../Channel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/WebServer.dir/Channel.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Channel.o -c /Users/julian/Desktop/Project/server/Channel.cpp

CMakeFiles/WebServer.dir/Channel.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Channel.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/Channel.cpp > CMakeFiles/WebServer.dir/Channel.i

CMakeFiles/WebServer.dir/Channel.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Channel.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/Channel.cpp -o CMakeFiles/WebServer.dir/Channel.s

CMakeFiles/WebServer.dir/Channel.o.requires:

.PHONY : CMakeFiles/WebServer.dir/Channel.o.requires

CMakeFiles/WebServer.dir/Channel.o.provides: CMakeFiles/WebServer.dir/Channel.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/Channel.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/Channel.o.provides

CMakeFiles/WebServer.dir/Channel.o.provides.build: CMakeFiles/WebServer.dir/Channel.o


CMakeFiles/WebServer.dir/Epoll.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/Epoll.o: ../Epoll.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/WebServer.dir/Epoll.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Epoll.o -c /Users/julian/Desktop/Project/server/Epoll.cpp

CMakeFiles/WebServer.dir/Epoll.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Epoll.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/Epoll.cpp > CMakeFiles/WebServer.dir/Epoll.i

CMakeFiles/WebServer.dir/Epoll.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Epoll.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/Epoll.cpp -o CMakeFiles/WebServer.dir/Epoll.s

CMakeFiles/WebServer.dir/Epoll.o.requires:

.PHONY : CMakeFiles/WebServer.dir/Epoll.o.requires

CMakeFiles/WebServer.dir/Epoll.o.provides: CMakeFiles/WebServer.dir/Epoll.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/Epoll.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/Epoll.o.provides

CMakeFiles/WebServer.dir/Epoll.o.provides.build: CMakeFiles/WebServer.dir/Epoll.o


CMakeFiles/WebServer.dir/EventLoop.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/EventLoop.o: ../EventLoop.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/WebServer.dir/EventLoop.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/EventLoop.o -c /Users/julian/Desktop/Project/server/EventLoop.cpp

CMakeFiles/WebServer.dir/EventLoop.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/EventLoop.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/EventLoop.cpp > CMakeFiles/WebServer.dir/EventLoop.i

CMakeFiles/WebServer.dir/EventLoop.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/EventLoop.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/EventLoop.cpp -o CMakeFiles/WebServer.dir/EventLoop.s

CMakeFiles/WebServer.dir/EventLoop.o.requires:

.PHONY : CMakeFiles/WebServer.dir/EventLoop.o.requires

CMakeFiles/WebServer.dir/EventLoop.o.provides: CMakeFiles/WebServer.dir/EventLoop.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/EventLoop.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/EventLoop.o.provides

CMakeFiles/WebServer.dir/EventLoop.o.provides.build: CMakeFiles/WebServer.dir/EventLoop.o


CMakeFiles/WebServer.dir/EventLoopThread.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/EventLoopThread.o: ../EventLoopThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/WebServer.dir/EventLoopThread.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/EventLoopThread.o -c /Users/julian/Desktop/Project/server/EventLoopThread.cpp

CMakeFiles/WebServer.dir/EventLoopThread.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/EventLoopThread.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/EventLoopThread.cpp > CMakeFiles/WebServer.dir/EventLoopThread.i

CMakeFiles/WebServer.dir/EventLoopThread.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/EventLoopThread.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/EventLoopThread.cpp -o CMakeFiles/WebServer.dir/EventLoopThread.s

CMakeFiles/WebServer.dir/EventLoopThread.o.requires:

.PHONY : CMakeFiles/WebServer.dir/EventLoopThread.o.requires

CMakeFiles/WebServer.dir/EventLoopThread.o.provides: CMakeFiles/WebServer.dir/EventLoopThread.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/EventLoopThread.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/EventLoopThread.o.provides

CMakeFiles/WebServer.dir/EventLoopThread.o.provides.build: CMakeFiles/WebServer.dir/EventLoopThread.o


CMakeFiles/WebServer.dir/EventLoopThreadPool.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/EventLoopThreadPool.o: ../EventLoopThreadPool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/WebServer.dir/EventLoopThreadPool.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/EventLoopThreadPool.o -c /Users/julian/Desktop/Project/server/EventLoopThreadPool.cpp

CMakeFiles/WebServer.dir/EventLoopThreadPool.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/EventLoopThreadPool.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/EventLoopThreadPool.cpp > CMakeFiles/WebServer.dir/EventLoopThreadPool.i

CMakeFiles/WebServer.dir/EventLoopThreadPool.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/EventLoopThreadPool.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/EventLoopThreadPool.cpp -o CMakeFiles/WebServer.dir/EventLoopThreadPool.s

CMakeFiles/WebServer.dir/EventLoopThreadPool.o.requires:

.PHONY : CMakeFiles/WebServer.dir/EventLoopThreadPool.o.requires

CMakeFiles/WebServer.dir/EventLoopThreadPool.o.provides: CMakeFiles/WebServer.dir/EventLoopThreadPool.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/EventLoopThreadPool.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/EventLoopThreadPool.o.provides

CMakeFiles/WebServer.dir/EventLoopThreadPool.o.provides.build: CMakeFiles/WebServer.dir/EventLoopThreadPool.o


CMakeFiles/WebServer.dir/HttpData.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/HttpData.o: ../HttpData.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/WebServer.dir/HttpData.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/HttpData.o -c /Users/julian/Desktop/Project/server/HttpData.cpp

CMakeFiles/WebServer.dir/HttpData.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/HttpData.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/HttpData.cpp > CMakeFiles/WebServer.dir/HttpData.i

CMakeFiles/WebServer.dir/HttpData.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/HttpData.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/HttpData.cpp -o CMakeFiles/WebServer.dir/HttpData.s

CMakeFiles/WebServer.dir/HttpData.o.requires:

.PHONY : CMakeFiles/WebServer.dir/HttpData.o.requires

CMakeFiles/WebServer.dir/HttpData.o.provides: CMakeFiles/WebServer.dir/HttpData.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/HttpData.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/HttpData.o.provides

CMakeFiles/WebServer.dir/HttpData.o.provides.build: CMakeFiles/WebServer.dir/HttpData.o


CMakeFiles/WebServer.dir/Main.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/Main.o: ../Main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/WebServer.dir/Main.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Main.o -c /Users/julian/Desktop/Project/server/Main.cpp

CMakeFiles/WebServer.dir/Main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Main.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/Main.cpp > CMakeFiles/WebServer.dir/Main.i

CMakeFiles/WebServer.dir/Main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Main.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/Main.cpp -o CMakeFiles/WebServer.dir/Main.s

CMakeFiles/WebServer.dir/Main.o.requires:

.PHONY : CMakeFiles/WebServer.dir/Main.o.requires

CMakeFiles/WebServer.dir/Main.o.provides: CMakeFiles/WebServer.dir/Main.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/Main.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/Main.o.provides

CMakeFiles/WebServer.dir/Main.o.provides.build: CMakeFiles/WebServer.dir/Main.o


CMakeFiles/WebServer.dir/Server.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/Server.o: ../Server.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/WebServer.dir/Server.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Server.o -c /Users/julian/Desktop/Project/server/Server.cpp

CMakeFiles/WebServer.dir/Server.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Server.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/Server.cpp > CMakeFiles/WebServer.dir/Server.i

CMakeFiles/WebServer.dir/Server.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Server.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/Server.cpp -o CMakeFiles/WebServer.dir/Server.s

CMakeFiles/WebServer.dir/Server.o.requires:

.PHONY : CMakeFiles/WebServer.dir/Server.o.requires

CMakeFiles/WebServer.dir/Server.o.provides: CMakeFiles/WebServer.dir/Server.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/Server.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/Server.o.provides

CMakeFiles/WebServer.dir/Server.o.provides.build: CMakeFiles/WebServer.dir/Server.o


CMakeFiles/WebServer.dir/Timer.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/Timer.o: ../Timer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/WebServer.dir/Timer.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Timer.o -c /Users/julian/Desktop/Project/server/Timer.cpp

CMakeFiles/WebServer.dir/Timer.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Timer.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/Timer.cpp > CMakeFiles/WebServer.dir/Timer.i

CMakeFiles/WebServer.dir/Timer.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Timer.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/Timer.cpp -o CMakeFiles/WebServer.dir/Timer.s

CMakeFiles/WebServer.dir/Timer.o.requires:

.PHONY : CMakeFiles/WebServer.dir/Timer.o.requires

CMakeFiles/WebServer.dir/Timer.o.provides: CMakeFiles/WebServer.dir/Timer.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/Timer.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/Timer.o.provides

CMakeFiles/WebServer.dir/Timer.o.provides.build: CMakeFiles/WebServer.dir/Timer.o


CMakeFiles/WebServer.dir/Util.o: CMakeFiles/WebServer.dir/flags.make
CMakeFiles/WebServer.dir/Util.o: ../Util.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/WebServer.dir/Util.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/WebServer.dir/Util.o -c /Users/julian/Desktop/Project/server/Util.cpp

CMakeFiles/WebServer.dir/Util.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/WebServer.dir/Util.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/julian/Desktop/Project/server/Util.cpp > CMakeFiles/WebServer.dir/Util.i

CMakeFiles/WebServer.dir/Util.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/WebServer.dir/Util.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/julian/Desktop/Project/server/Util.cpp -o CMakeFiles/WebServer.dir/Util.s

CMakeFiles/WebServer.dir/Util.o.requires:

.PHONY : CMakeFiles/WebServer.dir/Util.o.requires

CMakeFiles/WebServer.dir/Util.o.provides: CMakeFiles/WebServer.dir/Util.o.requires
	$(MAKE) -f CMakeFiles/WebServer.dir/build.make CMakeFiles/WebServer.dir/Util.o.provides.build
.PHONY : CMakeFiles/WebServer.dir/Util.o.provides

CMakeFiles/WebServer.dir/Util.o.provides.build: CMakeFiles/WebServer.dir/Util.o


# Object files for target WebServer
WebServer_OBJECTS = \
"CMakeFiles/WebServer.dir/Channel.o" \
"CMakeFiles/WebServer.dir/Epoll.o" \
"CMakeFiles/WebServer.dir/EventLoop.o" \
"CMakeFiles/WebServer.dir/EventLoopThread.o" \
"CMakeFiles/WebServer.dir/EventLoopThreadPool.o" \
"CMakeFiles/WebServer.dir/HttpData.o" \
"CMakeFiles/WebServer.dir/Main.o" \
"CMakeFiles/WebServer.dir/Server.o" \
"CMakeFiles/WebServer.dir/Timer.o" \
"CMakeFiles/WebServer.dir/Util.o"

# External object files for target WebServer
WebServer_EXTERNAL_OBJECTS =

WebServer: CMakeFiles/WebServer.dir/Channel.o
WebServer: CMakeFiles/WebServer.dir/Epoll.o
WebServer: CMakeFiles/WebServer.dir/EventLoop.o
WebServer: CMakeFiles/WebServer.dir/EventLoopThread.o
WebServer: CMakeFiles/WebServer.dir/EventLoopThreadPool.o
WebServer: CMakeFiles/WebServer.dir/HttpData.o
WebServer: CMakeFiles/WebServer.dir/Main.o
WebServer: CMakeFiles/WebServer.dir/Server.o
WebServer: CMakeFiles/WebServer.dir/Timer.o
WebServer: CMakeFiles/WebServer.dir/Util.o
WebServer: CMakeFiles/WebServer.dir/build.make
WebServer: base/libserver_base.a
WebServer: CMakeFiles/WebServer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Linking CXX executable WebServer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/WebServer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/WebServer.dir/build: WebServer

.PHONY : CMakeFiles/WebServer.dir/build

CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/Channel.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/Epoll.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/EventLoop.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/EventLoopThread.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/EventLoopThreadPool.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/HttpData.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/Main.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/Server.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/Timer.o.requires
CMakeFiles/WebServer.dir/requires: CMakeFiles/WebServer.dir/Util.o.requires

.PHONY : CMakeFiles/WebServer.dir/requires

CMakeFiles/WebServer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/WebServer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/WebServer.dir/clean

CMakeFiles/WebServer.dir/depend:
	cd /Users/julian/Desktop/Project/server/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/julian/Desktop/Project/server /Users/julian/Desktop/Project/server /Users/julian/Desktop/Project/server/cmake-build-debug /Users/julian/Desktop/Project/server/cmake-build-debug /Users/julian/Desktop/Project/server/cmake-build-debug/CMakeFiles/WebServer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/WebServer.dir/depend

