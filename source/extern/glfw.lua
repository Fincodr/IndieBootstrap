
project "glfw"
	kind "StaticLib"
	language "c"
	includedirs {"glfw/include", "glfw/src"}
	targetdir "../libs"
	objdir "../tmp/glfw"
	
	files {
		"glfw/src/internal.h",
		"glfw/include/GLFW/glfw3.h",
		"glfw/include/GLFW/glfw3native.h",
		"glfw/src/clipboard.c", "glfw/src/context.c", "glfw/src/gamma.c", "glfw/src/init.c",
		"glfw/src/input.c", "glfw/src/joystick.c", "glfw/src/monitor.c", "glfw/src/time.c",
		"glfw/src/window.c"
	};
	
	defines {"_GLFW_USE_OPENGL"}
	
	configuration "windows"
		defines {"_GLFW_WIN32", "_GLFW_WGL"}
		files { "glfw/src/win32_*" }
		files { "glfw/src/wgl_*" }
		
	configuration "linux"
	    defines {"_GLFW_X11", "_GLFW_GLX"}
		files { "glfw/src/x11_*" }
		files { "glfw/src/glx_*" }
		buildoptions{ "-lGL" }

	configuration "osx"
	    defines {"_GLFW_COCOA", "_GLFW_NSGL"}
		files { "glfw/src/cocoa_*" }
		files { "glfw/src/nsgl_*" }
		buildoptions{ "-framework OpenGL" }
		
	configuration "Debug"
		targetsuffix "D"
		defines "_DEBUG"
		flags "Symbols"

	configuration "Release"
		defines "NDEBUG"
		flags {"OptimizeSpeed", "NoFramePointer", "ExtraWarnings", "NoEditAndContinue"};
