
project "portaudio"
	kind "StaticLib"
	language "c++"
	flags { "NoExceptions", "NoRTTI", "NoPCH" }
	targetdir "../libs"
	objdir "../tmp/portaudio"

	includedirs {
		"portaudio/include",
		"portaudio/src/common"
	}
	files {
		"portaudio/src/common/**"
	};
	
	defines {"PA_USE_DS"}
	
	configuration "windows"
		includedirs { "portaudio/src/os/win" }
		files {
			"portaudio/src/os/win/**",
			"portaudio/src/hostapi/dsound/**"
		}
		
	configuration "linux"
		includedirs { "portaudio/src/os/unix" }
		files {
			"portaudio/src/os/unix/**",
			"portaudio/src/hostapi/coreaudio/**"
		}

	configuration "osx"
		includedirs { "portaudio/src/os/mac_osx" }
		files {
			"portaudio/src/os/mac_osx/**",
			"portaudio/src/hostapi/coreaudio/**"
		}
		
	configuration "Debug"
		targetsuffix "D"
		defines "_DEBUG"
		flags "Symbols"

	configuration "Release"
		defines "NDEBUG"
		flags {"OptimizeSpeed", "NoFramePointer", "ExtraWarnings", "NoEditAndContinue"};
