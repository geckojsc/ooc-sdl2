use sdl2-mixer

MixFormat: enum {
    default_: extern(MIX_DEFAULT_FORMAT)
}

MixMusic: cover from Mix_Music* {

    play: extern(Mix_PlayMusic) func (channel: Int) -> Int

}

MixChunk: cover from Mix_Chunk* {

    /* returns channel on which it's playing, or -1 */
    play: func (channel: Int, loops: Int) -> Int {
        Mix_PlayChannel(channel, this, loops)
    }

    volume: extern(Mix_VolumeChunk) func (volume: Int) -> Int
    free: extern(Mix_FreeChunk) func

}

Mix_PlayChannel: extern func (channel: Int, chunk: MixChunk, loops: Int) -> Int

Mix: class {

    openAudio: static extern(Mix_OpenAudio) func (rate: Int, format: MixFormat,
        channels: Int, bufferSize: Int) -> Int

    closeAudio: static extern(Mix_CloseAudio) func

    allocateChannels: static extern(Mix_AllocateChannels) func (numChannels: Int)

    loadMus: static extern(Mix_LoadMUS) func (path: CString) -> MixMusic
    haltMusic: static extern(Mix_HaltMusic) func
    fadeOutMusic: static extern(Mix_FadeOutMusic) func (milliseconds: Int)
    setMusicPosition: static extern(Mix_SetMusicPosition) func (pos: Double)
    hookMusicFinished: static extern(Mix_HookMusicFinished) func (callback: Pointer)

    playingMusic: static extern(Mix_PlayingMusic) func -> Bool
    pausedMusic: static extern(Mix_PausedMusic) func -> Bool

    loadWav: static extern(Mix_LoadWAV) func (path: CString) -> MixChunk

    haltChannel: static extern(Mix_HaltChannel) func (channel: Int)

    getChunk: static extern(Mix_GetChunk) func (channel: Int) -> MixChunk

    volume: static extern(Mix_Volume) func (channel: Int, volume: Int) -> Int
    volumeMusic: static extern(Mix_VolumeMusic) func (volume: Int) -> Int

    getError: static extern(Mix_GetError) func -> CString

}

