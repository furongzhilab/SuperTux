import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.0
import "../common"


SceneBase {
    id:loadScene

    property bool gameRunning : false

    Rectangle{
        id:rec
        anchors.fill: gameWindowAnchorItem
        color: "black"

    }
    Image {
        x:200;
        id: image;
        source: "../../assets/penguin/tux/fire/sprite/tux_hat.png";
        visible: false
    }

      Item {
       anchors.verticalCenter: parent.gameWindowAnchorItem.verticalCenter
       anchors.horizontalCenter: parent.gameWindowAnchorItem.horizontalCenter
       id: sequence;
       width: 30;
       height: 50;

       SpriteSequence {
           id:spritetest
           anchors.fill: parent

           sprites: [
               Sprite {
                   name: "first"
                   source: image.source
                   frameCount: 8;
                   frameWidth: image.width/4;
                   frameHeight: image.height/2;
                   frameRate: 7;

               }


           ]
       }
   }

            ProgressBar{
                id: control
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 190
                value: 0.1
                padding: 2
                background: Rectangle {
                    implicitWidth:  100
                    implicitHeight:  15
                    color: "white"
                    radius: 3
                }

                Text {
                    id: text1
                    color: "blue"
                    text: Math.floor(control.value * 100) + "%"
                    z: 2
                    anchors.centerIn: parent
                }

                Timer {
                    id: time
                    interval: 250
                    repeat: true
                    running: gameRunning

                    onTriggered: {
                        if(opacity === 1) {
                            running: false
                        }

                        if (control.value < 0.99)
                        {
                            control.value += 0.5
                        }
                        else {
                            text1.text = 100 + "%"
                            stop();
                            gameWindow.state = "game"
                            activeScene: gameScene
                        }
                    }
                }
            }
        }

