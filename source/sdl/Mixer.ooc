use sdl-mixer

MixFormat: enum {
    default: extern(MIX_DEFAULT_FORMAT)
}

MixMusic: cover from Mix_Music* {

    play: extern(Mix_PlayMusic) func (channel: Int) -> Int

}

MixChunk: cover from Mix_Chunk* {

    /* returns channel on which it's playing, or -1 */
    play: func (channel: Int, loops: Int) -> Int {
        Mix_PlayChannel(channel, this, loops)
    }

}

Mix_PlayChannel: extern func (channel: Int, chunk: MixChunk, loops: Int) -> Int

Mix: class {

    openAudio: static extern(Mix_OpenAudio) func (rate: Int, format: MixFormat,
        channels: Int, bufferSize: Int) -> Int

    closeAudio: static extern(Mix_CloseAudio) func

    allocateChannels: static extern(Mix_AllocateChannels) func (numChannels: Int)

    loadMus: static extern(Mix_LoadMUS) func (path: CString) -> MixMusic

    haltMusic: static extern(Mix_HaltMusic) func

    loadWav: static extern(Mix_LoadWAV) func (path: CString) -> MixChunk

    haltChannel: static extern(Mix_HaltChannel) func (channel: Int)

    getChunk: static extern(Mix_GetChunk) func (channel: Int) -> MixChunk

}

