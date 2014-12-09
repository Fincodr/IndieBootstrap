
project "box2d"
	kind "StaticLib"
	language "c++"
	targetdir "../libs"
	objdir "../tmp/box2d"

	flags { "NoExceptions", "NoRTTI", "NoPCH" }

  	libdirs {
    	"libs"
  	}

	files { "box2d/Box2D/**.h", "box2d/Box2D/**.cpp" }
	includedirs { "box2d" }

	defines { "_CRT_SECURE_NO_WARNINGS" }

	configuration "windows"
		
	configuration "linux"

	configuration "osx"
		
	configuration "Debug"
		targetsuffix "D"
		defines "_DEBUG"
		flags "Symbols"

	configuration "Release"
		defines "NDEBUG"
		flags { "OptimizeSpeed", "EnableSSE2", "NoFramePointer", "ExtraWarnings", "No64BitChecks", "NoEditAndContinue"};
