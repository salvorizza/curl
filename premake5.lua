project "Curl"
	language    "C"
	kind        "StaticLib"
	externalincludedirs { "include" }
	includedirs { "lib" }
	defines     { "BUILDING_LIBCURL", "CURL_STATICLIB", "HTTP_ONLY" }
	warnings    "off"

	files
	{
		"include/**.h",
		"include/**.c",
		"lib/**.h",
		"lib/**.c",
	}

	filter { "system:windows" }
		defines { "USE_SCHANNEL", "USE_WINDOWS_SSPI" }
		links "crypt32"

	filter { "system:macosx" }
		defines { "USE_DARWINSSL" }

	filter { "system:linux or bsd or solaris" }
		defines { "CURL_HIDDEN_SYMBOLS" }