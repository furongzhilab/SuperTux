
import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: menuScene
    width: 960
    height: 640

    // signal indicating that the creditsScene should be displayed
    signal creditsPressed

    ParallaxScrollingBackground {
        sourceImage: "../../assets/background/begin_background.jpg"
        anchors.fill: parent.gameWindowAnchorItem
        movementVelocity: Qt.point(-20,0)
        // the speed then gets multiplied by this ratio to create the parallax effect
        ratio: Qt.point(0.3,0)
    }
    // background
    Item{
        id:background
        anchors.fill: parent.gameWindowAnchorItem

        Image{
            anchors.fill: parent
            source: "../../assets/background/frame.png"
        }

        Image{
            id:logo
            anchors.top: parent.top
            anchors.topMargin: 24
            anchors.horizontalCenter: parent.horizontalCenter
            source: "../../assets/background/logo.png"
            width: 280
            height: 180
        }
    }

    // menu
    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 230
        color: "#5F9F9F"
        opacity: 0.7
        width: 160
        height: 210
        radius: 40

        MenuButton {
            id:begin
            text: "开始游戏"
            onClicked: {
                gameWindow.state = "level"
            }
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
        }
        MenuButton {
            id:explain
            text: "操作说明"
            onClicked: {
                gameWindow.state="explain"
            }
            anchors.top: parent.top
            anchors.topMargin: 80
            anchors.right: parent.right
            anchors.rightMargin: 10
        }
        MenuButton {
            id:exit
            text: "退出游戏"
            onClicked: {
                Qt.quit()
            }
            anchors.top: parent.top
            anchors.topMargin: 140
            anchors.right: parent.right
            anchors.rightMargin: 10
        }

    }

    Image {
        x: 220
        id: image1
        source: "../../assets/penguin/sprite/walk.png"
        visible: false
    }

    Item {
        anchors.left: parent.gameWindowAnchorItem.left
        anchors.bottom: parent.gameWindowAnchorItem.bottom
        anchors.leftMargin: 180
        anchors.bottomMargin: 200
        id: sequence;
        width: 90;
        height: 70;


        SpriteSequence {
            id:spritetest
            anchors.fill: parent

            sprites: [
                Sprite {
                    name: "first"
                    source: image1.source
                    frameCount: 8;
                    frameWidth: image1.width/8;
                    frameHeight: image1.height;
                    frameRate: 9;
                }
            ]
        }
    }
}
