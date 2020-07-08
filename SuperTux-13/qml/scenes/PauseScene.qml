import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0
import "../common"

SceneBase{
    id: pauseScene


    GameScene{
        id:gameScene
        anchors.fill: parent
        opacity:1
    }


    Rectangle {
        id: rectangle
        anchors.fill: parent.gameWindowAnchorItem
        color:"lightblue"
        opacity: 0.5
    }

    Item{
        anchors.fill: rectangle
        id:pause_buttons

        PauseButton{
            id:start_black
            image_button.source:"../../assets/editor/redo.png"
            anchors.top: parent.top
            anchors.topMargin: 120
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                gameWindow.state = "game"
                if(ismusic==false)
                    audioManager.stopMusic()

            }
        }

        PauseButton{
            id:music
            image_button.source:"../../assets/editor/music.png"
            anchors.left: start_black.right
            anchors.top: start_black.bottom
            anchors.leftMargin: 10
            onClicked: {
                if(ismusic==true){
                    audioManager.stopMusic()
                    ismusic=false

                }
                else{
                    audioManager.handleMusic()
                    ismusic=true

                }
            }
        }
        PauseButton{
            id:sound
            image_button.source:"../../assets/editor/ambientsound.png"
            anchors.right: start_black.left
            anchors.top: start_black.bottom
            anchors.rightMargin: 10
            onClicked: {

                if(issound==true){
                    audioManager.playSound()
                    issound=false

                }
                else{
                    issound=true

                }
            }
        }
        PauseButton{
            id:restart
            image_button.source:"../../assets/editor/undo.png"
            anchors.right: start_black.left
            anchors.rightMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 80
            onClicked: {
                if(ismusic==false)
                    audioManager.stopMusic()
                gameWindow.state="load"
            }
        }
        PauseButton{
            id:exit
            Text {
                id:exit_text
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                text: qsTr("Menu")
                color: "white"
                font.pixelSize: 20
            }
            anchors.left: start_black.right
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 80
            onClicked: {
                if(ismusic==false)
                    audioManager.stopMusic()
                gameWindow.state="menu"
            }

        }
        Text {
            id: text
            text: qsTr("设置")
            font.pixelSize: 40
            color: "blue"
            anchors.top: parent.top
            anchors.topMargin: 45
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}

