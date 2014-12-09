
project "soloud"
	kind "StaticLib"
	language "c++"
	targetdir "../libs"
	objdir "../tmp/soloud"

	flags { "NoExceptions", "NoRTTI", "NoPCH" }

  	libdirs {
    	"libs"
  	}

	files {
		"soloud/src/audiosource/**.c*",
		"soloud/src/filter/**.c*",
		"soloud/src/core/**.c*",
	  	"soloud/src/backend/portaudio/**.c*",
	  	"soloud/ext/libmodplug/src/**.cpp*"
	}

	includedirs {
		"soloud/src/**",
		"soloud/include",
		"portaudio/include",
		"soloud/ext/libmodplug/src/**"
	}

	defines { "MODPLUG_STATIC", "WITH_PORTAUDIO", "WITH_MODPLUG" }

	configuration "windows"
		includedirs { "src/os/win" }
		files {
			"soloud/src/os/win/**",
			"soloud/src/hostapi/dsound/**"
		}
		
	configuration "linux"
		includedirs { "src/os/unix" }
		files {
			"soloud/src/os/unix/**",
			"soloud/src/hostapi/coreaudio/**"
		}

	configuration "osx"
		includedirs { "src/os/mac_osx" }
		files {
			"soloud/src/os/mac_osx/**",
			"soloud/src/hostapi/coreaudio/**"
		}
		
	configuration "Debug"
		targetsuffix "D"
		defines "_DEBUG"
		flags "Symbols"

	configuration "Release"
		defines "NDEBUG"
		flags { "OptimizeSpeed", "EnableSSE2", "NoFramePointer", "ExtraWarnings", "No64BitChecks", "NoEditAndContinue"};
