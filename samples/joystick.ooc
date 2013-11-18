use sdl2
import sdl2/[Core, Event, Joystick]

main: func (argc: Int, argv: CString*) {
	
	SDL init(SDL_INIT_EVERYTHING)
	
	// create a 600x400 window, in no specific place
	window := SDL createWindow(
		"Hello SDL2!",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		600, 400, SDL_WINDOW_SHOWN)

	// create a hardware-accelerated rendering target
	renderer := SDL createRenderer(window, -1, SDL_RENDERER_ACCELERATED)
	
	// clear the screen to taupe, and apply the changes
	SDL setRenderDrawColor(renderer, 72, 60, 50, 255)
	SDL renderClear(renderer)
	SDL renderPresent(renderer)

        // enumerate joysticks and do something with them
        numJoys := SdlJoystick num()
        "Found %d joysticks" printfln(numJoys)

        "Will start demo in 2 seconds..." println()
        SDL delay(2000)

        SdlJoystick eventState(SdlJoystickEventState query)

        for (i in 0..numJoys) {
            "=================" println()
            "For joystick %d" printfln(i + 1)
            joy := SdlJoystick open(i)

            guid := joy getGUID()
            "GUID = %s" printfln(guid toString())

            "%d hats" printfln(joy numHats())
            "%d buttons" printfln(joy numButtons())
            "%d balls" printfln(joy numBalls())
            "%d axes" printfln(joy numAxes())

            while (true) {
                numButtons := joy numButtons()

                if (numButtons > 0) {
                    "buttons: " print()
                    for (i in 0..numButtons) {
                        "%d " format(joy getButton(i) as Int) print()
                    }
                }

                numAxes := joy numAxes()

                if (numAxes > 0) {
                    "axis: " print()
                    for (i in 0..numAxes) {
                        "%d " format(joy getAxis(i) as Int) print()
                    }
                }

                numHats := joy numHats()

                if (numHats > 0) {
                    "hats: " print()
                    for (i in 0..numHats) {
                        "%d " format(joy getHat(i) as Int) print()
                    }
                }

                println()
                SDL delay(20)
                SDL renderClear(renderer)
                SDL renderPresent(renderer)

                SdlEvent pump()
                SdlJoystick update()
            }

            joy close()
        }
	
	SDL destroyRenderer(renderer)
	SDL destroyWindow(window)
	SDL quit()
}

