/*
  version: 2.4
  author: zhuchengmiao and furongzhi and zhanghonglan
  time: 2020/07/07
  This QML file controls the switching between scenarios.
  */
import Felgo 3.0
import QtQuick 2.0
import "scenes"
import "common"

GameWindow {
    id: gameWindow

    screenWidth: 960
    screenHeight: 640
    property bool ismusic: true
    property bool issound: true

    // update background music when scene changes
    onActiveSceneChanged: {
        audioManager.handleMusic()
    }

    AudioManager {
        id: audioManager
    }

    // Scenes -----------------------------------------
    BeginScene{
        id:beginScene
    }

    SecondScene {
        id: secondScene
    }

    MenuScene {
        id: menuScene
    }

    LoadScene {
        id: loadScene
    }

    GameScene {
        id: gameScene
        onBackPressed: {
            gameScene.resetLevel()
            gameWindow.state = "value"
        }
    }
    ExplainScene{
        id:explainScene
        onBackButtonPressed: gameWindow.state = "menu"
    }

    PauseScene {
        id: pauseScene
    }

    LevelScene{
        id:levelScene
        onLevelPressed: {
            // selectedLevel is the parameter of the levelPressed signal
            gameScene.setLevel(selectedLevel)

            gameWindow.state = "game"

        }
        onBackButtonPressed: gameWindow.state = "menu"
    }

    // states
    state: "begin"
    activeScene: beginScene

    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: menuScene}
        },

        State {
            name: "begin"
            PropertyChanges {target: beginScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: beginScene}
        },
        State {
            name: "load"
            PropertyChanges {target: loadScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: loadScene}
            PropertyChanges {target: loadScene; gameRunning: true
            }
        },

        State {
            name: "explain"
            PropertyChanges {target: explainScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: explainScene}
        },
        State {
            name: "level"
            PropertyChanges {target: levelScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: levelScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}
        },
        State {
            name: "pause"
            PropertyChanges {target: pauseScene; opacity: 1}
            PropertyChanges {target: gameWindow; activeScene: pauseScene}
        }
    ]

    // the entity manager handles all our entities
    EntityManager {
        id: entityManager

        // here we define the container the entityManager manages
        // so all entities, the entityManager creates are in this container
        entityContainer: gameScene.container

        poolingEnabled: true
    }
}
