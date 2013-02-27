use sdl2
import sdl2/Core

SdlMouseMotionEvent: cover from SDL_MouseMotionEvent {
    x, y: extern Int
    xrel, yrel: extern Int
}

SdlKeysym: cover from SDL_Keysym {
    sym: extern Int
    scancode: extern Int
}

SdlMouseButtonEvent: cover from SDL_MouseButtonEvent {
    button: extern Int
}

SdlKeyboardEvent: cover from SDL_KeyboardEvent {
    keysym: extern SdlKeysym
}

SdlWindowEvent: cover from SDL_WindowEvent {
    event: extern Int
    data1, data2: extern Int
}

SdlEvent: cover from SDL_Event {
    type: extern Int
    key: extern SdlKeyboardEvent
    motion: extern SdlMouseMotionEvent
    button: extern SdlMouseButtonEvent
    window: extern SdlWindowEvent

    wait: extern(SDL_WaitEvent) static func(SdlEvent*) -> Int
    poll: extern(SDL_PollEvent) static func(SdlEvent*) -> Int
    pump: extern(SDL_PumpEvents) static func
}


/*
 * KEYCODES
 */

SDLK_UNKNOWN    : extern Int
SDLK_FIRST      : extern Int
SDLK_BACKSPACE  : extern Int
SDLK_TAB        : extern Int
SDLK_CLEAR      : extern Int
SDLK_RETURN     : extern Int
SDLK_PAUSE      : extern Int
SDLK_ESCAPE     : extern Int
SDLK_SPACE      : extern Int
SDLK_EXCLAIM    : extern Int
SDLK_QUOTEDBL   : extern Int
SDLK_HASH       : extern Int
SDLK_DOLLAR     : extern Int
SDLK_AMPERSAND  : extern Int
SDLK_QUOTE      : extern Int
SDLK_LEFTPAREN  : extern Int
SDLK_RIGHTPAREN : extern Int
SDLK_ASTERISK   : extern Int
SDLK_PLUS       : extern Int
SDLK_COMMA      : extern Int
SDLK_MINUS      : extern Int
SDLK_PERIOD     : extern Int
SDLK_SLASH      : extern Int
SDLK_0          : extern Int
SDLK_1          : extern Int
SDLK_2          : extern Int
SDLK_3          : extern Int
SDLK_4          : extern Int
SDLK_5          : extern Int
SDLK_6          : extern Int
SDLK_7          : extern Int
SDLK_8          : extern Int
SDLK_9          : extern Int
SDLK_COLON      : extern Int
SDLK_SEMICOLON  : extern Int
SDLK_LESS       : extern Int
SDLK_EQUALS     : extern Int
SDLK_GREATER    : extern Int
SDLK_QUESTION   : extern Int
SDLK_AT         : extern Int
/* 
    Skip uppercase letters
  */
SDLK_LEFTBRACKET  : extern Int
SDLK_BACKSLASH    : extern Int
SDLK_RIGHTBRACKET : extern Int
SDLK_CARET        : extern Int
SDLK_UNDERSCORE   : extern Int
SDLK_BACKQUOTE    : extern Int
SDLK_a            : extern Int
SDLK_b            : extern Int
SDLK_c            : extern Int
SDLK_d            : extern Int
SDLK_e            : extern Int
SDLK_f            : extern Int
SDLK_g            : extern Int
SDLK_h            : extern Int
SDLK_i            : extern Int
SDLK_j            : extern Int
SDLK_k            : extern Int
SDLK_l            : extern Int
SDLK_m            : extern Int
SDLK_n            : extern Int
SDLK_o            : extern Int
SDLK_p            : extern Int
SDLK_q            : extern Int
SDLK_r            : extern Int
SDLK_s            : extern Int
SDLK_t            : extern Int
SDLK_u            : extern Int
SDLK_v            : extern Int
SDLK_w            : extern Int
SDLK_x            : extern Int
SDLK_y            : extern Int
SDLK_z            : extern Int
SDLK_DELETE       : extern Int
/* End of ASCII mapped keysyms */

/* International keyboard syms */
SDLK_WORLD_0  : extern Int		/* 0xA0 */
SDLK_WORLD_1  : extern Int
SDLK_WORLD_2  : extern Int
SDLK_WORLD_3  : extern Int
SDLK_WORLD_4  : extern Int
SDLK_WORLD_5  : extern Int
SDLK_WORLD_6  : extern Int
SDLK_WORLD_7  : extern Int
SDLK_WORLD_8  : extern Int
SDLK_WORLD_9  : extern Int
SDLK_WORLD_10 : extern Int
SDLK_WORLD_11 : extern Int
SDLK_WORLD_12 : extern Int
SDLK_WORLD_13 : extern Int
SDLK_WORLD_14 : extern Int
SDLK_WORLD_15 : extern Int
SDLK_WORLD_16 : extern Int
SDLK_WORLD_17 : extern Int
SDLK_WORLD_18 : extern Int
SDLK_WORLD_19 : extern Int
SDLK_WORLD_20 : extern Int
SDLK_WORLD_21 : extern Int
SDLK_WORLD_22 : extern Int
SDLK_WORLD_23 : extern Int
SDLK_WORLD_24 : extern Int
SDLK_WORLD_25 : extern Int
SDLK_WORLD_26 : extern Int
SDLK_WORLD_27 : extern Int
SDLK_WORLD_28 : extern Int
SDLK_WORLD_29 : extern Int
SDLK_WORLD_30 : extern Int
SDLK_WORLD_31 : extern Int
SDLK_WORLD_32 : extern Int
SDLK_WORLD_33 : extern Int
SDLK_WORLD_34 : extern Int
SDLK_WORLD_35 : extern Int
SDLK_WORLD_36 : extern Int
SDLK_WORLD_37 : extern Int
SDLK_WORLD_38 : extern Int
SDLK_WORLD_39 : extern Int
SDLK_WORLD_40 : extern Int
SDLK_WORLD_41 : extern Int
SDLK_WORLD_42 : extern Int
SDLK_WORLD_43 : extern Int
SDLK_WORLD_44 : extern Int
SDLK_WORLD_45 : extern Int
SDLK_WORLD_46 : extern Int
SDLK_WORLD_47 : extern Int
SDLK_WORLD_48 : extern Int
SDLK_WORLD_49 : extern Int
SDLK_WORLD_50 : extern Int
SDLK_WORLD_51 : extern Int
SDLK_WORLD_52 : extern Int
SDLK_WORLD_53 : extern Int
SDLK_WORLD_54 : extern Int
SDLK_WORLD_55 : extern Int
SDLK_WORLD_56 : extern Int
SDLK_WORLD_57 : extern Int
SDLK_WORLD_58 : extern Int
SDLK_WORLD_59 : extern Int
SDLK_WORLD_60 : extern Int
SDLK_WORLD_61 : extern Int
SDLK_WORLD_62 : extern Int
SDLK_WORLD_63 : extern Int
SDLK_WORLD_64 : extern Int
SDLK_WORLD_65 : extern Int
SDLK_WORLD_66 : extern Int
SDLK_WORLD_67 : extern Int
SDLK_WORLD_68 : extern Int
SDLK_WORLD_69 : extern Int
SDLK_WORLD_70 : extern Int
SDLK_WORLD_71 : extern Int
SDLK_WORLD_72 : extern Int
SDLK_WORLD_73 : extern Int
SDLK_WORLD_74 : extern Int
SDLK_WORLD_75 : extern Int
SDLK_WORLD_76 : extern Int
SDLK_WORLD_77 : extern Int
SDLK_WORLD_78 : extern Int
SDLK_WORLD_79 : extern Int
SDLK_WORLD_80 : extern Int
SDLK_WORLD_81 : extern Int
SDLK_WORLD_82 : extern Int
SDLK_WORLD_83 : extern Int
SDLK_WORLD_84 : extern Int
SDLK_WORLD_85 : extern Int
SDLK_WORLD_86 : extern Int
SDLK_WORLD_87 : extern Int
SDLK_WORLD_88 : extern Int
SDLK_WORLD_89 : extern Int
SDLK_WORLD_90 : extern Int
SDLK_WORLD_91 : extern Int
SDLK_WORLD_92 : extern Int
SDLK_WORLD_93 : extern Int
SDLK_WORLD_94 : extern Int
SDLK_WORLD_95 : extern Int		/* 0xFF */

/* Numeric keypad */
SDLK_KP_0         : extern Int
SDLK_KP_1         : extern Int
SDLK_KP_2         : extern Int
SDLK_KP_3         : extern Int
SDLK_KP_4         : extern Int
SDLK_KP_5         : extern Int
SDLK_KP_6         : extern Int
SDLK_KP_7         : extern Int
SDLK_KP_8         : extern Int
SDLK_KP_9         : extern Int
SDLK_KP_PERIOD   : extern Int
SDLK_KP_DIVIDE   : extern Int
SDLK_KP_MULTIPLY : extern Int
SDLK_KP_MINUS    : extern Int
SDLK_KP_PLUS     : extern Int
SDLK_KP_ENTER    : extern Int
SDLK_KP_EQUALS   : extern Int

/* Arrows + Home/End pad */
SDLK_UP	      : extern Int
SDLK_DOWN     : extern Int
SDLK_RIGHT    : extern Int
SDLK_LEFT     : extern Int
SDLK_INSERT   : extern Int
SDLK_HOME     : extern Int
SDLK_END      : extern Int
SDLK_PAGEUP   : extern Int
SDLK_PAGEDOWN : extern Int

/* Function keys */
SDLK_F1  : extern Int
SDLK_F2  : extern Int
SDLK_F3  : extern Int
SDLK_F4  : extern Int
SDLK_F5  : extern Int
SDLK_F6  : extern Int
SDLK_F7  : extern Int
SDLK_F8  : extern Int
SDLK_F9  : extern Int
SDLK_F10 : extern Int
SDLK_F11 : extern Int
SDLK_F12 : extern Int
SDLK_F13 : extern Int
SDLK_F14 : extern Int
SDLK_F15 : extern Int

/* Key state modifier keys */
SDLK_NUMLOCK   : extern Int
SDLK_CAPSLOCK  : extern Int
SDLK_SCROLLOCK : extern Int
SDLK_RSHIFT    : extern Int
SDLK_LSHIFT    : extern Int
SDLK_RCTRL     : extern Int
SDLK_LCTRL     : extern Int
SDLK_RALT      : extern Int
SDLK_LALT      : extern Int
SDLK_RMETA     : extern Int
SDLK_LMETA     : extern Int
SDLK_LSUPER    : extern Int/* Left "Windows" key */
SDLK_RSUPER    : extern Int/* Right "Windows" key */
SDLK_MODE      : extern Int/* "Alt Gr" key */
SDLK_COMPOSE   : extern Int/* Multi-key compose key */

/* Miscellaneous function keys */
SDLK_HELP   : extern Int
SDLK_PRINT  : extern Int
SDLK_SYSREQ : extern Int
SDLK_BREAK  : extern Int
SDLK_MENU   : extern Int
SDLK_POWER  : extern Int/* Power Macintosh power key */
SDLK_EURO   : extern Int/* Some european keyboards */
SDLK_UNDO   : extern Int/* Atari keyboard has Undo */

/* Add any other keys here */

SDL_VIDEOEXPOSE : extern Int

SDL_QUIT             : extern Int
SDL_KEYDOWN          : extern Int
SDL_KEYUP            : extern Int
SDL_MOUSEBUTTONUP    : extern Int
SDL_MOUSEBUTTONDOWN  : extern Int
SDL_BUTTON_WHEELUP   : extern Int
SDL_BUTTON_RIGHT     : extern Int
SDL_BUTTON_MIDDLE    : extern Int
SDL_BUTTON_LEFT      : extern Int
SDL_BUTTON_WHEELDOWN : extern Int
SDL_MOUSEMOTION      : extern Int
SDL_WINDOWEVENT      : extern Int

SDL_WINDOWEVENT_SHOWN             : extern Int
SDL_WINDOWEVENT_HIDDEN            : extern Int
SDL_WINDOWEVENT_EXPOSED           : extern Int
SDL_WINDOWEVENT_MOVED             : extern Int
SDL_WINDOWEVENT_RESIZED           : extern Int
SDL_WINDOWEVENT_SIZE_CHANGED      : extern Int
SDL_WINDOWEVENT_MINIMIZED         : extern Int
SDL_WINDOWEVENT_MAXIMIZED         : extern Int
SDL_WINDOWEVENT_RESTORED          : extern Int
SDL_WINDOWEVENT_ENTER             : extern Int
SDL_WINDOWEVENT_LEAVE             : extern Int
SDL_WINDOWEVENT_FOCUS_GAINED      : extern Int
SDL_WINDOWEVENT_FOCUS_LOST        : extern Int
SDL_WINDOWEVENT_CLOSE             : extern Int

KMOD_LCTRL  : extern Int
KMOD_RCTRL  : extern Int
KMOD_SHIFT  : extern Int
KMOD_LSHIFT : extern Int
KMOD_RSHIFT : extern Int


/*
 * SCANCODES
 */

SDL_NUM_SCANCODES : extern Int

SDL_SCANCODE_UNKNOWN : extern Int

SDL_SCANCODE_A : extern Int
SDL_SCANCODE_B : extern Int
SDL_SCANCODE_C : extern Int
SDL_SCANCODE_D : extern Int
SDL_SCANCODE_E : extern Int
SDL_SCANCODE_F : extern Int
SDL_SCANCODE_G : extern Int
SDL_SCANCODE_H : extern Int
SDL_SCANCODE_I : extern Int
SDL_SCANCODE_J : extern Int
SDL_SCANCODE_K : extern Int
SDL_SCANCODE_L : extern Int
SDL_SCANCODE_M : extern Int
SDL_SCANCODE_N : extern Int
SDL_SCANCODE_O : extern Int
SDL_SCANCODE_P : extern Int
SDL_SCANCODE_Q : extern Int
SDL_SCANCODE_R : extern Int
SDL_SCANCODE_S : extern Int
SDL_SCANCODE_T : extern Int
SDL_SCANCODE_U : extern Int
SDL_SCANCODE_V : extern Int
SDL_SCANCODE_W : extern Int
SDL_SCANCODE_X : extern Int
SDL_SCANCODE_Y : extern Int
SDL_SCANCODE_Z : extern Int

SDL_SCANCODE_1 : extern Int
SDL_SCANCODE_2 : extern Int
SDL_SCANCODE_3 : extern Int
SDL_SCANCODE_4 : extern Int
SDL_SCANCODE_5 : extern Int
SDL_SCANCODE_6 : extern Int
SDL_SCANCODE_7 : extern Int
SDL_SCANCODE_8 : extern Int
SDL_SCANCODE_9 : extern Int
SDL_SCANCODE_0 : extern Int

SDL_SCANCODE_RETURN    : extern Int
SDL_SCANCODE_ESCAPE    : extern Int
SDL_SCANCODE_BACKSPACE : extern Int
SDL_SCANCODE_TAB       : extern Int
SDL_SCANCODE_SPACE     : extern Int

SDL_SCANCODE_MINUS        : extern Int
SDL_SCANCODE_EQUALS       : extern Int
SDL_SCANCODE_LEFTBRACKET  : extern Int
SDL_SCANCODE_RIGHTBRACKET : extern Int
SDL_SCANCODE_BACKSLASH    : extern Int
SDL_SCANCODE_NONUSHASH    : extern Int
SDL_SCANCODE_SEMICOLON    : extern Int
SDL_SCANCODE_APOSTROPHE   : extern Int
SDL_SCANCODE_GRAVE        : extern Int
SDL_SCANCODE_COMMA        : extern Int
SDL_SCANCODE_PERIOD       : extern Int
SDL_SCANCODE_SLASH        : extern Int
SDL_SCANCODE_CAPSLOCK     : extern Int
SDL_SCANCODE_F1           : extern Int
SDL_SCANCODE_F2           : extern Int
SDL_SCANCODE_F3           : extern Int
SDL_SCANCODE_F4           : extern Int
SDL_SCANCODE_F5           : extern Int
SDL_SCANCODE_F6           : extern Int
SDL_SCANCODE_F7           : extern Int
SDL_SCANCODE_F8           : extern Int
SDL_SCANCODE_F9           : extern Int
SDL_SCANCODE_F10          : extern Int
SDL_SCANCODE_F11          : extern Int
SDL_SCANCODE_F12          : extern Int
SDL_SCANCODE_PRINTSCREEN  : extern Int
SDL_SCANCODE_SCROLLLOCK   : extern Int
SDL_SCANCODE_PAUSE        : extern Int
SDL_SCANCODE_INSERT       : extern Int
SDL_SCANCODE_HOME         : extern Int
SDL_SCANCODE_PAGEUP       : extern Int
SDL_SCANCODE_DELETE       : extern Int
SDL_SCANCODE_END          : extern Int
SDL_SCANCODE_PAGEDOWN     : extern Int
SDL_SCANCODE_RIGHT        : extern Int
SDL_SCANCODE_LEFT         : extern Int
SDL_SCANCODE_DOWN         : extern Int
SDL_SCANCODE_UP           : extern Int

SDL_SCANCODE_NUMLOCKCLEAR : extern Int/* numlock on PC, clear on Mac */
SDL_SCANCODE_KP_DIVIDE    : extern Int
SDL_SCANCODE_KP_MULTIPLY  : extern Int
SDL_SCANCODE_KP_MINUS     : extern Int
SDL_SCANCODE_KP_PLUS      : extern Int
SDL_SCANCODE_KP_ENTER     : extern Int
SDL_SCANCODE_KP_1         : extern Int
SDL_SCANCODE_KP_2         : extern Int
SDL_SCANCODE_KP_3         : extern Int
SDL_SCANCODE_KP_4         : extern Int
SDL_SCANCODE_KP_5         : extern Int
SDL_SCANCODE_KP_6         : extern Int
SDL_SCANCODE_KP_7         : extern Int
SDL_SCANCODE_KP_8         : extern Int
SDL_SCANCODE_KP_9         : extern Int
SDL_SCANCODE_KP_0         : extern Int
SDL_SCANCODE_KP_PERIOD    : extern Int

SDL_SCANCODE_NONUSBACKSLASH : extern Int
SDL_SCANCODE_APPLICATION    : extern Int
SDL_SCANCODE_KP_EQUALS      : extern Int

SDL_SCANCODE_F13        : extern Int
SDL_SCANCODE_F14        : extern Int
SDL_SCANCODE_F15        : extern Int
SDL_SCANCODE_F16        : extern Int
SDL_SCANCODE_F17        : extern Int
SDL_SCANCODE_F18        : extern Int
SDL_SCANCODE_F19        : extern Int
SDL_SCANCODE_F20        : extern Int
SDL_SCANCODE_F21        : extern Int
SDL_SCANCODE_F22        : extern Int
SDL_SCANCODE_F23        : extern Int
SDL_SCANCODE_F24        : extern Int
SDL_SCANCODE_EXECUTE    : extern Int
SDL_SCANCODE_HELP       : extern Int
SDL_SCANCODE_MENU       : extern Int
SDL_SCANCODE_SELECT     : extern Int
SDL_SCANCODE_STOP       : extern Int
SDL_SCANCODE_AGAIN      : extern Int
SDL_SCANCODE_UNDO       : extern Int
SDL_SCANCODE_CUT        : extern Int
SDL_SCANCODE_COPY       : extern Int
SDL_SCANCODE_PASTE      : extern Int
SDL_SCANCODE_FIND       : extern Int
SDL_SCANCODE_MUTE       : extern Int
SDL_SCANCODE_VOLUMEUP   : extern Int
SDL_SCANCODE_VOLUMEDOWN : extern Int

SDL_SCANCODE_KP_COMMA       : extern Int
SDL_SCANCODE_KP_EQUALSAS400 : extern Int

SDL_SCANCODE_INTERNATIONAL1 : extern Int
SDL_SCANCODE_INTERNATIONAL2 : extern Int
SDL_SCANCODE_INTERNATIONAL3 : extern Int
SDL_SCANCODE_INTERNATIONAL4 : extern Int
SDL_SCANCODE_INTERNATIONAL5 : extern Int
SDL_SCANCODE_INTERNATIONAL6 : extern Int
SDL_SCANCODE_INTERNATIONAL7 : extern Int
SDL_SCANCODE_INTERNATIONAL8 : extern Int
SDL_SCANCODE_INTERNATIONAL9 : extern Int
SDL_SCANCODE_LANG1 : extern Int
SDL_SCANCODE_LANG2 : extern Int
SDL_SCANCODE_LANG3 : extern Int
SDL_SCANCODE_LANG4 : extern Int
SDL_SCANCODE_LANG5 : extern Int
SDL_SCANCODE_LANG6 : extern Int
SDL_SCANCODE_LANG7 : extern Int
SDL_SCANCODE_LANG8 : extern Int
SDL_SCANCODE_LANG9 : extern Int

SDL_SCANCODE_ALTERASE   : extern Int
SDL_SCANCODE_SYSREQ     : extern Int
SDL_SCANCODE_CANCEL     : extern Int
SDL_SCANCODE_CLEAR      : extern Int
SDL_SCANCODE_PRIOR      : extern Int
SDL_SCANCODE_RETURN2    : extern Int
SDL_SCANCODE_SEPARATOR  : extern Int
SDL_SCANCODE_OUT        : extern Int
SDL_SCANCODE_OPER       : extern Int
SDL_SCANCODE_CLEARAGAIN : extern Int
SDL_SCANCODE_CRSEL      : extern Int
SDL_SCANCODE_EXSEL      : extern Int

SDL_SCANCODE_KP_00              : extern Int
SDL_SCANCODE_KP_000             : extern Int
SDL_SCANCODE_THOUSANDSSEPARATOR : extern Int
SDL_SCANCODE_DECIMALSEPARATOR   : extern Int
SDL_SCANCODE_CURRENCYUNIT       : extern Int
SDL_SCANCODE_CURRENCYSUBUNIT    : extern Int
SDL_SCANCODE_KP_LEFTPAREN       : extern Int
SDL_SCANCODE_KP_RIGHTPAREN      : extern Int
SDL_SCANCODE_KP_LEFTBRACE       : extern Int
SDL_SCANCODE_KP_RIGHTBRACE      : extern Int
SDL_SCANCODE_KP_TAB             : extern Int
SDL_SCANCODE_KP_BACKSPACE       : extern Int
SDL_SCANCODE_KP_A               : extern Int
SDL_SCANCODE_KP_B               : extern Int
SDL_SCANCODE_KP_C               : extern Int
SDL_SCANCODE_KP_D               : extern Int
SDL_SCANCODE_KP_E               : extern Int
SDL_SCANCODE_KP_F               : extern Int
SDL_SCANCODE_KP_XOR             : extern Int
SDL_SCANCODE_KP_POWER           : extern Int
SDL_SCANCODE_KP_PERCENT         : extern Int
SDL_SCANCODE_KP_LESS            : extern Int
SDL_SCANCODE_KP_GREATER         : extern Int
SDL_SCANCODE_KP_AMPERSAND       : extern Int
SDL_SCANCODE_KP_DBLAMPERSAND    : extern Int
SDL_SCANCODE_KP_VERTICALBAR     : extern Int
SDL_SCANCODE_KP_DBLVERTICALBAR  : extern Int
SDL_SCANCODE_KP_COLON           : extern Int
SDL_SCANCODE_KP_HASH            : extern Int
SDL_SCANCODE_KP_SPACE           : extern Int
SDL_SCANCODE_KP_AT              : extern Int
SDL_SCANCODE_KP_EXCLAM          : extern Int
SDL_SCANCODE_KP_MEMSTORE        : extern Int
SDL_SCANCODE_KP_MEMRECALL       : extern Int
SDL_SCANCODE_KP_MEMCLEAR        : extern Int
SDL_SCANCODE_KP_MEMADD          : extern Int
SDL_SCANCODE_KP_MEMSUBTRACT     : extern Int
SDL_SCANCODE_KP_MEMMULTIPLY     : extern Int
SDL_SCANCODE_KP_MEMDIVIDE       : extern Int
SDL_SCANCODE_KP_PLUSMINUS       : extern Int
SDL_SCANCODE_KP_CLEAR           : extern Int
SDL_SCANCODE_KP_CLEARENTRY      : extern Int
SDL_SCANCODE_KP_BINARY          : extern Int
SDL_SCANCODE_KP_OCTAL           : extern Int
SDL_SCANCODE_KP_DECIMAL         : extern Int
SDL_SCANCODE_KP_HEXADECIMAL     : extern Int

SDL_SCANCODE_LCTRL  : extern Int
SDL_SCANCODE_LSHIFT : extern Int
SDL_SCANCODE_LALT   : extern Int
SDL_SCANCODE_LGUI   : extern Int
SDL_SCANCODE_RCTRL  : extern Int
SDL_SCANCODE_RSHIFT : extern Int
SDL_SCANCODE_RALT   : extern Int/* alt gr, option */
SDL_SCANCODE_RGUI   : extern Int/* windows, command (apple), meta */

SDL_SCANCODE_AUDIONEXT    : extern Int
SDL_SCANCODE_AUDIOPREV    : extern Int
SDL_SCANCODE_AUDIOSTOP    : extern Int
SDL_SCANCODE_AUDIOPLAY    : extern Int
SDL_SCANCODE_AUDIOMUTE    : extern Int
SDL_SCANCODE_MEDIASELECT  : extern Int
SDL_SCANCODE_WWW          : extern Int
SDL_SCANCODE_MAIL         : extern Int
SDL_SCANCODE_CALCULATOR   : extern Int
SDL_SCANCODE_COMPUTER     : extern Int
SDL_SCANCODE_AC_SEARCH    : extern Int
SDL_SCANCODE_AC_HOME      : extern Int
SDL_SCANCODE_AC_BACK      : extern Int
SDL_SCANCODE_AC_FORWARD   : extern Int
SDL_SCANCODE_AC_STOP      : extern Int
SDL_SCANCODE_AC_REFRESH   : extern Int
SDL_SCANCODE_AC_BOOKMARKS : extern Int

SDL_SCANCODE_BRIGHTNESSDOWN : extern Int
SDL_SCANCODE_BRIGHTNESSUP   : extern Int
SDL_SCANCODE_DISPLAYSWITCH  : extern Int/* display mirroring/dual display switch, video mode switch */
SDL_SCANCODE_KBDILLUMTOGGLE : extern Int
SDL_SCANCODE_KBDILLUMDOWN   : extern Int
SDL_SCANCODE_KBDILLUMUP     : extern Int
SDL_SCANCODE_EJECT          : extern Int
SDL_SCANCODE_SLEEP          : extern Int
