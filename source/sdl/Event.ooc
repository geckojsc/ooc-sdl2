use sdl
import sdl/Core

Motion: cover from SDL_MouseMotionEvent {
	x,y: extern Int
	xrel, yrel: extern Int
}

Keysym: cover from SDL_keysym {
	sym: extern Int
    unicode: extern UInt16
}

Button: cover from SDL_MouseButtonEvent {
	button: extern Int
}

Active: cover from SDL_ActiveEvent {
	gain: extern UInt8
}

Key: cover from SDL_KeyboardEvent {
	keysym: extern Keysym
}

Resize: cover from SDL_ResizeEvent {
	w,h: extern Int
}

Event: cover from SDL_Event {
	type: extern Int
	key: extern Key
	motion: extern Motion
	active: extern Active
	resize: extern Resize
	button: extern Button
}


SDLEvent: cover {
	wait: extern(SDL_WaitEvent) static func(Event*) -> Int
	poll: extern(SDL_PollEvent) static func(Event*) -> Int
	pump: extern(SDL_PumpEvents) static func
}

SDLK_UNKNOWN		: extern Int
SDLK_FIRST		: extern Int
SDLK_BACKSPACE		: extern Int
SDLK_TAB		: extern Int
SDLK_CLEAR		: extern Int
SDLK_RETURN		: extern Int
SDLK_PAUSE		: extern Int
SDLK_ESCAPE		: extern Int
SDLK_SPACE		: extern Int
SDLK_EXCLAIM		: extern Int
SDLK_QUOTEDBL		: extern Int
SDLK_HASH		: extern Int
SDLK_DOLLAR		: extern Int
SDLK_AMPERSAND		: extern Int
SDLK_QUOTE		: extern Int
SDLK_LEFTPAREN		: extern Int
SDLK_RIGHTPAREN		: extern Int
SDLK_ASTERISK		: extern Int
SDLK_PLUS		: extern Int
SDLK_COMMA		: extern Int
SDLK_MINUS		: extern Int
SDLK_PERIOD		: extern Int
SDLK_SLASH		: extern Int
SDLK_0			: extern Int
SDLK_1			: extern Int
SDLK_2			: extern Int
SDLK_3			: extern Int
SDLK_4			: extern Int
SDLK_5			: extern Int
SDLK_6			: extern Int
SDLK_7			: extern Int
SDLK_8			: extern Int
SDLK_9			: extern Int
SDLK_COLON		: extern Int
SDLK_SEMICOLON		: extern Int
SDLK_LESS		: extern Int
SDLK_EQUALS		: extern Int
SDLK_GREATER		: extern Int
SDLK_QUESTION		: extern Int
SDLK_AT			: extern Int
/* 
    Skip uppercase letters
  */
SDLK_LEFTBRACKET	: extern Int
SDLK_BACKSLASH		: extern Int
SDLK_RIGHTBRACKET	: extern Int
SDLK_CARET		: extern Int
SDLK_UNDERSCORE		: extern Int
SDLK_BACKQUOTE		: extern Int
SDLK_a			: extern Int
SDLK_b			: extern Int
SDLK_c			: extern Int
SDLK_d			: extern Int
SDLK_e			: extern Int
SDLK_f			: extern Int
SDLK_g			: extern Int
SDLK_h			: extern Int
SDLK_i			: extern Int
SDLK_j			: extern Int
SDLK_k			: extern Int
SDLK_l			: extern Int
SDLK_m			: extern Int
SDLK_n			: extern Int
SDLK_o			: extern Int
SDLK_p			: extern Int
SDLK_q			: extern Int
SDLK_r			: extern Int
SDLK_s			: extern Int
SDLK_t			: extern Int
SDLK_u			: extern Int
SDLK_v			: extern Int
SDLK_w			: extern Int
SDLK_x			: extern Int
SDLK_y			: extern Int
SDLK_z			: extern Int
SDLK_DELETE		: extern Int
/* End of ASCII mapped keysyms */

/* International keyboard syms */
SDLK_WORLD_0		: extern Int		/* 0xA0 */
SDLK_WORLD_1		: extern Int
SDLK_WORLD_2		: extern Int
SDLK_WORLD_3		: extern Int
SDLK_WORLD_4		: extern Int
SDLK_WORLD_5		: extern Int
SDLK_WORLD_6		: extern Int
SDLK_WORLD_7		: extern Int
SDLK_WORLD_8		: extern Int
SDLK_WORLD_9		: extern Int
SDLK_WORLD_10		: extern Int
SDLK_WORLD_11		: extern Int
SDLK_WORLD_12		: extern Int
SDLK_WORLD_13		: extern Int
SDLK_WORLD_14		: extern Int
SDLK_WORLD_15		: extern Int
SDLK_WORLD_16		: extern Int
SDLK_WORLD_17		: extern Int
SDLK_WORLD_18		: extern Int
SDLK_WORLD_19		: extern Int
SDLK_WORLD_20		: extern Int
SDLK_WORLD_21		: extern Int
SDLK_WORLD_22		: extern Int
SDLK_WORLD_23		: extern Int
SDLK_WORLD_24		: extern Int
SDLK_WORLD_25		: extern Int
SDLK_WORLD_26		: extern Int
SDLK_WORLD_27		: extern Int
SDLK_WORLD_28		: extern Int
SDLK_WORLD_29		: extern Int
SDLK_WORLD_30		: extern Int
SDLK_WORLD_31		: extern Int
SDLK_WORLD_32		: extern Int
SDLK_WORLD_33		: extern Int
SDLK_WORLD_34		: extern Int
SDLK_WORLD_35		: extern Int
SDLK_WORLD_36		: extern Int
SDLK_WORLD_37		: extern Int
SDLK_WORLD_38		: extern Int
SDLK_WORLD_39		: extern Int
SDLK_WORLD_40		: extern Int
SDLK_WORLD_41		: extern Int
SDLK_WORLD_42		: extern Int
SDLK_WORLD_43		: extern Int
SDLK_WORLD_44		: extern Int
SDLK_WORLD_45		: extern Int
SDLK_WORLD_46		: extern Int
SDLK_WORLD_47		: extern Int
SDLK_WORLD_48		: extern Int
SDLK_WORLD_49		: extern Int
SDLK_WORLD_50		: extern Int
SDLK_WORLD_51		: extern Int
SDLK_WORLD_52		: extern Int
SDLK_WORLD_53		: extern Int
SDLK_WORLD_54		: extern Int
SDLK_WORLD_55		: extern Int
SDLK_WORLD_56		: extern Int
SDLK_WORLD_57		: extern Int
SDLK_WORLD_58		: extern Int
SDLK_WORLD_59		: extern Int
SDLK_WORLD_60		: extern Int
SDLK_WORLD_61		: extern Int
SDLK_WORLD_62		: extern Int
SDLK_WORLD_63		: extern Int
SDLK_WORLD_64		: extern Int
SDLK_WORLD_65		: extern Int
SDLK_WORLD_66		: extern Int
SDLK_WORLD_67		: extern Int
SDLK_WORLD_68		: extern Int
SDLK_WORLD_69		: extern Int
SDLK_WORLD_70		: extern Int
SDLK_WORLD_71		: extern Int
SDLK_WORLD_72		: extern Int
SDLK_WORLD_73		: extern Int
SDLK_WORLD_74		: extern Int
SDLK_WORLD_75		: extern Int
SDLK_WORLD_76		: extern Int
SDLK_WORLD_77		: extern Int
SDLK_WORLD_78		: extern Int
SDLK_WORLD_79		: extern Int
SDLK_WORLD_80		: extern Int
SDLK_WORLD_81		: extern Int
SDLK_WORLD_82		: extern Int
SDLK_WORLD_83		: extern Int
SDLK_WORLD_84		: extern Int
SDLK_WORLD_85		: extern Int
SDLK_WORLD_86		: extern Int
SDLK_WORLD_87		: extern Int
SDLK_WORLD_88		: extern Int
SDLK_WORLD_89		: extern Int
SDLK_WORLD_90		: extern Int
SDLK_WORLD_91		: extern Int
SDLK_WORLD_92		: extern Int
SDLK_WORLD_93		: extern Int
SDLK_WORLD_94		: extern Int
SDLK_WORLD_95		: extern Int		/* 0xFF */

/* Numeric keypad */
SDLK_KP0		: extern Int
SDLK_KP1		: extern Int
SDLK_KP2		: extern Int
SDLK_KP3		: extern Int
SDLK_KP4		: extern Int
SDLK_KP5		: extern Int
SDLK_KP6		: extern Int
SDLK_KP7		: extern Int
SDLK_KP8		: extern Int
SDLK_KP9		: extern Int
SDLK_KP_PERIOD		: extern Int
SDLK_KP_DIVIDE		: extern Int
SDLK_KP_MULTIPLY	: extern Int
SDLK_KP_MINUS		: extern Int
SDLK_KP_PLUS		: extern Int
SDLK_KP_ENTER		: extern Int
SDLK_KP_EQUALS		: extern Int

/* Arrows + Home/End pad */
SDLK_UP			: extern Int
SDLK_DOWN		: extern Int
SDLK_RIGHT		: extern Int
SDLK_LEFT		: extern Int
SDLK_INSERT		: extern Int
SDLK_HOME		: extern Int
SDLK_END		: extern Int
SDLK_PAGEUP		: extern Int
SDLK_PAGEDOWN		: extern Int

/* Function keys */
SDLK_F1			: extern Int
SDLK_F2			: extern Int
SDLK_F3			: extern Int
SDLK_F4			: extern Int
SDLK_F5			: extern Int
SDLK_F6			: extern Int
SDLK_F7			: extern Int
SDLK_F8			: extern Int
SDLK_F9			: extern Int
SDLK_F10		: extern Int
SDLK_F11		: extern Int
SDLK_F12		: extern Int
SDLK_F13		: extern Int
SDLK_F14		: extern Int
SDLK_F15		: extern Int

/* Key state modifier keys */
SDLK_NUMLOCK		: extern Int
SDLK_CAPSLOCK		: extern Int
SDLK_SCROLLOCK		: extern Int
SDLK_RSHIFT		: extern Int
SDLK_LSHIFT		: extern Int
SDLK_RCTRL		: extern Int
SDLK_LCTRL		: extern Int
SDLK_RALT		: extern Int
SDLK_LALT		: extern Int
SDLK_RMETA		: extern Int
SDLK_LMETA		: extern Int
SDLK_LSUPER		: extern Int		/* Left "Windows" key */
SDLK_RSUPER		: extern Int		/* Right "Windows" key */
SDLK_MODE		: extern Int		/* "Alt Gr" key */
SDLK_COMPOSE		: extern Int		/* Multi-key compose key */

/* Miscellaneous function keys */
SDLK_HELP		: extern Int
SDLK_PRINT		: extern Int
SDLK_SYSREQ		: extern Int
SDLK_BREAK		: extern Int
SDLK_MENU		: extern Int
SDLK_POWER		: extern Int		/* Power Macintosh power key */
SDLK_EURO		: extern Int		/* Some european keyboards */
SDLK_UNDO		: extern Int		/* Atari keyboard has Undo */

/* Add any other keys here */

SDL_VIDEOEXPOSE: extern Int

SDL_QUIT: extern Int
SDL_KEYDOWN: extern Int
SDL_KEYUP: extern Int
SDL_MOUSEBUTTONUP: extern Int
SDL_MOUSEBUTTONDOWN: extern Int
SDL_BUTTON_WHEELUP: extern Int
SDL_BUTTON_RIGHT: extern Int
SDL_BUTTON_MIDDLE: extern Int
SDL_BUTTON_LEFT: extern Int
SDL_BUTTON_WHEELDOWN: extern Int

SDL_MOUSEMOTION : extern Int

SDL_ACTIVEEVENT : extern Int

SDL_VIDEORESIZE : extern Int


KMOD_LCTRL  : extern Int
KMOD_RCTRL  : extern Int
KMOD_SHIFT  : extern Int
KMOD_LSHIFT : extern Int
KMOD_RSHIFT : extern Int
