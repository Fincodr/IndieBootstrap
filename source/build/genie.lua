-- OpenGL solution
solution "IndieBootstrap"
  configurations { "Debug", "Release" }
  platforms { "x32", "x64" }
  startproject "Bootstrap"
  location (_ACTION)

  -- A project defines one build target
  project "Bootstrap"
      kind "ConsoleApp"
      language "C++"
      files { "../src/**.h", "../src/**.cpp" }
      flags { "NoExceptions", "NoRTTI", "NoPCH" }
      includedirs { "../extern/glfw/include" }
      includedirs { "../extern/glew/include" }
      includedirs { "../extern/soil2/src" }
      includedirs { "../extern/portaudio/include" }
      includedirs { "../extern/soloud/include" }
      includedirs { "../extern/box2d" }
      includedirs { "../extern/boost" }
      includedirs { "../extern/glm" }
      libdirs {
        "../libs"
      }
      links {"opengl32"}
      targetdir "../../dist"
      debugdir "../../dist"

      defines { "GLEW_STATIC", "WITH_PORTAUDIO" }

      defines {
        "_CRT_SECURE_NO_WARNINGS",
        "_SCL_SECURE_NO_WARNINGS",
        "BOOST_ALL_NO_LIB"
      }
 
      configuration "Debug"
        defines { "DEBUG" }
        flags { "Symbols" }
        links { "glfwD", "glewD", "soil2D", "soloudD", "portaudioD", "box2dD" }
        objdir "../tmp/bootstrap";
 
      configuration "Release"
        defines { "NDEBUG" }
        flags { "Optimize" }    
        links { "glfw", "glew", "soil2", "soloud", "portaudio", "box2d" }
        objdir "../tmp/bootstrap";

-- generate projects for extern libraries
local libPremakes = 
{
  "../extern/glfw.lua",
  "../extern/glew.lua",
  "../extern/soil2.lua",
  "../extern/portaudio.lua",
  "../extern/soloud.lua",
  "../extern/box2d.lua"
}

for i, luaPremake in ipairs(libPremakes) do
  if(#os.matchfiles(luaPremake) ~= 0) then
    dofile(luaPremake)
  end
end
