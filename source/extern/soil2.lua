function string.starts(String,Start)
	if ( _ACTION ) then
		return string.sub(String,1,string.len(Start))==Start
	end
	
	return false
end

function is_vs()
	return ( string.starts(_ACTION,"vs") )
end

project "soil2"
	kind "StaticLib"
	targetdir "../libs"
	objdir "../tmp/soil2"

	if is_vs() then
		language "C++"
		buildoptions { "/TP" }
		defines { "_CRT_SECURE_NO_WARNINGS" }
	else
		language "C"
	end
	
	files { "soil2/src/SOIL2/*.c" }

	configuration "debug"
		defines { "DEBUG" }
		flags { "Symbols" }
		if not is_vs() then
			buildoptions{ "-Wall" }
		end
		targetname "soil2D"

	configuration "release"
		defines { "NDEBUG" }
		flags { "Optimize" }
		targetname "soil2"