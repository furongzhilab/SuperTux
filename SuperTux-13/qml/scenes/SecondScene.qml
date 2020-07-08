import Felgo 3.0
import QtQuick 2.12
import "../common"
import "../entities"


SceneBase {
    id: startScene

    // background
    Item {
        id: item
        anchors.fill: parent.gameWindowAnchorItem
        Image {
            anchors.fill: parent
            source: "../../assets/img/second_background.jpg"
        }
        Image {
            id: image_ch
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 100
            source: "../../assets/img/title_ch.png"
        }
        Image {
            id: image
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: image_ch.horizontalCenter
            width: 180
            height: 40
            source: "../../assets/img/second_background1.png"
//            // make the ground float up gently by using a low gravity
//            PhysicsWorld { gravity.y: -1; debugDrawVisible: false }
        }
        Image {
            id: image_cat
            anchors.left: image.left
            anchors.leftMargin: 80
            anchors.bottom: image.top
            width: 50
            height: 55
            source: "../../assets/cat/cat_stand.png"
        }
        Text {
            id: name
            anchors.horizontalCenter: image_ch.horizontalCenter
            anchors.top: image_ch.bottom
            anchors.topMargin: 50
            font.pixelSize: 9
            color: "white"
            text: qsTr("按任意键继续")
            SequentialAnimation {
                ScaleAnimator{
                    loops: Animation.Infinite;
                    target: name
                    from: 1;
                    to: 0.8;
                    duration: 1000
                }
                ScaleAnimator{
                    loops: Animation.Infinite;
                    target: name
                    from: 0.8;
                    to: 1;
                    duration: 1000
                }
                running: true
            }
        }
    }

//    // fixed location
//    Ground {
//        width: gameWindowAnchorItem.width
//        anchors.bottom: image_cat.top
//    }

    Keys.onPressed: {
        gameWindow.state = "menu"
    }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            gameWindow.state = "menu"
        }
    }
}
