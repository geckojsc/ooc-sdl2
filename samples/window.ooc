use sdl
import sdl/[Core, Video]

main: func (argc: Int, argv: CString*) {
  SDL init(SDL_INIT_EVERYTHING)
  screen := SDLVideo setMode(640, 480, 0, SDL_HWSURFACE)
  SDLVideo wmSetCaption("", null)

  SDL delay(2000)

  SDL quit()
}
