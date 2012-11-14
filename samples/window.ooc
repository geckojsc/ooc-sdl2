use sdl
import sdl/[Core, Video]

main: func (argc: Int, argv: CString*) {
  SDL init(SDL_INIT_EVERYTHING)
  screen := SDLVideo setMode(640, 480, 0, SDL_HWSURFACE | SDL_DOUBLEBUF)
  SDLVideo wmSetCaption("", null)

  SDLVideo fillRect(screen, null, 0)
  SDLVideo flip(screen)

  SDL delay(2000)

  SDL quit()
}
