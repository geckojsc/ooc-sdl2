use sdl2
import sdl2/Core

// joysticks

SdlJoystick: cover from SDL_Joystick* {

    // static functions
    num: extern(SDL_NumJoysticks) static func -> Int
    update: extern(SDL_JoystickUpdate) static func
    open: extern(SDL_JoystickOpen) static func (deviceIndex: Int) -> This
    nameForIndex: extern(SDL_JoystickNameForIndex) static func (deviceIndex: Int) -> CString

    // guids
    getGUIDFromString: extern (SDL_JoystickGetGUIDFromString) static func (pchGUID: CString) -> SdlJoystickGUID
    getGUID: extern (SDL_JoystickGetGUID) func -> SdlJoystickGUID
    getDeviceGUID: extern (SDL_JoystickGetDeviceGUID) func (deviceIndex: Int) -> SdlJoystickGUID

    // general info
    numHats: extern(SDL_JoystickNumHats) func -> Int
    numButtons: extern(SDL_JoystickNumButtons) func -> Int
    numBalls: extern(SDL_JoystickNumBalls) func -> Int
    numAxes: extern(SDL_JoystickNumAxes) func -> Int
    name: extern(SDL_JoystickName) func -> CString
    instanceID: extern (SDL_JoystickInstanceID) func -> Int
    getAttached: extern (SDL_JoystickGetAttached) func -> Bool

    // set joystick events to query / ignore / enable
    eventState: extern (SDL_JoystickEventState) static func (state: SdlJoystickEventState) -> Int

    // state
    getHat: extern(SDL_JoystickGetHat) func (hat: Int) -> SdlHatState
    getButton: extern(SDL_JoystickGetButton) func (button: Int) -> UInt8
    getBall: extern(SDL_JoystickGetBall) func (ball: Int, dx: Int*, dy: Int*) -> Int
    getAxis: extern(SDL_JoystickGetAxis) func (axis: Int) -> Int16

    // cleanup
    close: extern(SDL_JoystickClose) func ()

}

SdlJoystickGUID: cover from SDL_JoystickGUID {

    toString: func -> String {
        bufSize := 256
        buffer := gc_malloc(bufSize) as CString
        _getGUIDString(buffer, bufSize)
        buffer toString()
    }

    _getGUIDString: extern (SDL_JoystickGetGUIDString) func (buffer: CString, bufSize: Int)

}

SdlHatState: enum {
    centered: extern(SDL_HAT_CENTERED)
    up: extern(SDL_HAT_UP)
    right: extern(SDL_HAT_RIGHT)
    down: extern(SDL_HAT_DOWN)
    left: extern(SDL_HAT_LEFT)
    rightup: extern(SDL_HAT_RIGHTUP)
    rightdown: extern(SDL_HAT_RIGHTDOWN)
    leftup: extern(SDL_HAT_LEFTUP)
    leftdown: extern(SDL_HAT_LEFTDOWN)
}

SdlJoystickEventState: enum {
    query: extern(SDL_QUERY)
    ignore: extern(SDL_IGNORE)
    enable: extern(SDL_ENABLE)
}


