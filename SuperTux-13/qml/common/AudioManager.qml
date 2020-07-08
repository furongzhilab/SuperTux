import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0
import "../entities"

Item {
    id: audioManager
    Component.onCompleted: handleMusic()

    /**
   * Background Music ----------------------------------
   */
    //ismusic
    BackgroundMusic {
        id: beginMusic
        autoPlay: false
        source: "../../assets/music/start.ogg"
    }

    BackgroundMusic {
        id: menuMusic
        autoPlay: false
        source: "../../assets/music/menu.ogg"
    }

    BackgroundMusic {
        id: loadMusic
        autoPlay: false
        source: "../../assets/music/LoadAndGame.ogg"
    }

    BackgroundMusic {
        id: playMusic
        autoPlay: false
        source: "../../assets/music/LoadAndGame.ogg"
    }

    //issound
    BackgroundMusic {
        id: penguinJump
        loops: 1
        autoPlay: false
        source: "../../assets/sound/jump.wav"
    }

    BackgroundMusic {
        id: penguinDie
        loops: 1
        autoPlay: false
        source: "../../assets/sound/hurt.wav"
    }

    BackgroundMusic {
        id: monsterRebotDie
        loops: 1
        autoPlay: false
        source: "../../assets/sound/opponent_die.wav"
    }

    BackgroundMusic {
        id: monsterIceDie
        loops: 1
        autoPlay: false
        source: "../../assets/sound/opponent_die.wav"
    }

    SoundEffect {
        id: monsterBombDie
        loops: 1
        source: "../../assets/sound/explosion.wav"
    }

    BackgroundMusic {
        id: flower
        loops: 1
        autoPlay: false
        source: "../../assets/sound/fire-flower.wav"
    }

    BackgroundMusic {
        id: win
        loops: 1
        autoPlay: false
        source: "../../assets/sound/win.ogg"
    }

    SoundEffect {
        id: coin
        loops: 1
        source: "../../assets/sound/coin.wav"
    }

    BackgroundMusic {
        id: hitBrick
        loops: 1
        autoPlay: false
        source: "../../assets/sound/hit.wav"
    }

    BackgroundMusic {
            id: hitBlock
            loops: 1
            autoPlay: false
            source: "../../assets/sound/hit.wav"
        }

    BackgroundMusic {
        id: penguinHurt
        loops: 1
        autoPlay: false
        source: "../../assets/sound/spike.wav"
    }

    function handleMusic() {
        if(gameWindow.state === "begin")
            audioManager.startMusic(beginMusic)
        else if(gameWindow.state==="menu"||gameWindow.state==="pause") {
            audioManager.startMusic(menuMusic)
        }
        else if(gameWindow.state === "load"){
            audioManager.startMusic(loadMusic)
        }
        else if(gameWindow.state === "game"){
            audioManager.startMusic(playMusic)
        }
    }

    // starts the given music
    function startMusic(music) {
        // if music is already playing, we don't have to do anything
        if(music.playing)
            return

        if(ismusic==true){
            // otherwise stop all music tracks
            beginMusic.stop()
            menuMusic.stop()
            loadMusic.stop()
            playMusic.stop()

            // play the music
            music.play()
        }
    }
    function stopMusic(){
        beginMusic.stop()
        menuMusic.stop()
        loadMusic.stop()
        playMusic.stop()
    }

    // play the sound effect with the given name
    function playSound(sound) {
        if(issound==true){
            if(sound === "penguinJump")
                penguinJump.play()
            else if(sound === "penguinDie")
                penguinDie.play()
            else if(sound === "hitbrick")
                hitBrick.play()
            else if(sound === "hitblock")
                hitBlock.play()
            else if(sound === "monsterRebotDie")
                monsterRebotDie.play()
            else if(sound === "monsterIceDie")
                monsterIceDie.play()
            else if(sound === "monsterBombDie")
                monsterBombDie.play()
            else if(sound === "coin")
                coin.play()
            else if(sound === "flower")
                flower.play()
            else if(sound === "penguinHurt")
                penguinHurt.play()
            else if(sound === "win")
                win.play()
        }
    }
}
