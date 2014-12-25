use sdl2
import sdl2/[Core, Image, Ttf]

main: func (argc: Int, argv: CString*) {
	
	SDL init(SDL_INIT_EVERYTHING)

    // init sdl_ttf library
    TTF init()
	
	window := SDL createWindow(
		"Render UTF8 text",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		600, 400, SDL_WINDOW_SHOWN)
	
	// Create a rendering target
	renderer := SDL createRenderer(window, -1, SDL_RENDERER_ACCELERATED)

    // load the font
    font := TTF open("./assets/octicons.ttf", 32)

    ("Font: %s, style: %s\nStyle: %d, Outline: %d, Hinting: %d, Kerning: %d\n"+
    "Fixed: %d, line: %d, ascent: %d, dscent:%d, height: %d\n") printfln(\
        font familyName(), font styleName(), \
        font getStyle(), font getOutline(), font getHinting(), \
        font getKerning(), font isFixedWidth(), font lineSkip(), font ascent(),\
        font descent(), font height()
    )

    // create text surface
    text := font renderUTF8Solid("\uf092" toCString(), (0,0,0,0) as SdlColor)
    texture := SDL createTextureFromSurface(renderer, text)
	
	// Clear the screen
	SDL setRenderDrawColor(renderer, 0, 40, 80, 255)
	SDL renderClear(renderer)
	
	// Draw the entire text
	SDL renderCopy(renderer, texture, null, null)
	
	// Update the screen
	SDL renderPresent(renderer)
	
	SDL delay(5000)

	SDL destroyRenderer(renderer)
	SDL destroyWindow(window)

    font close()

    TTF quit()
	
	SDL quit()
}
