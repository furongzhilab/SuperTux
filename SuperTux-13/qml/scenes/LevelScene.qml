import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase {
    id: levelScene

    // signal indicating that a level has been selected
    signal levelPressed(string selectedLevel)

    // background
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "lightblue"

        Text{
            anchors.fill: parent
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: 150
            text: qsTr("Levels")
            color: "#4A766E"
            font.pixelSize: 64
        }
    }

    // back button to leave scene
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device.

        anchors.right: levelScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: levelScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    // levels to be selected
    Grid {
        anchors.centerIn: parent
        spacing: 10
        columns: 5
        MenuButton {
            text: "level1"
            onClicked: {
                levelPressed("Level1.qml")
                gameWindow.state="load"
            }

        }
        MenuButton {
            text: "level2"
            onClicked: {
                levelPressed("Level2.qml")
                gameWindow.state="load"
            }
        }
        MenuButton {
            text: "level3"
            onClicked: {
                levelPressed("Level3.qml")
                gameWindow.state="load"
            }
        }
    }
}
