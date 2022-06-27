fx_version 'bodacious'
game 'gta5'
author 'Rafael Goulart'
version '1.0'

ui_page "Nui/ui.html"

files {
	"Nui/*.*",
	"Nui/**/*.*"
}

client_scripts {
	"@vrp/lib/utils.lua",
	"Client/*.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"Server/*.lua",
}