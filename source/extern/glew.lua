
project "glew"
	kind "StaticLib"
	language "c"
	includedirs {"glew/include", "glew/src"}
	targetdir "../libs"
	objdir "../tmp/glew"

	files {
		"glew/src/glew.c",
		"glew/include/GL/glew.h",
		"glew/include/GL/wglew.h"
	};
	
	defines {
		"_LIB",
		"WIN32_LEAN_AND_MEAN",
		"GLEW_STATIC"
	}
	
	configuration "windows"
		
	configuration "linux"

	configuration "osx"
		
	configuration "Debug"
		targetsuffix "D"
		defines "_DEBUG"
		flags "Symbols"

	configuration "Release"
		defines "NDEBUG"
		flags {"OptimizeSpeed", "NoFramePointer", "ExtraWarnings", "NoEditAndContinue"};
