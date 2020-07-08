import Felgo 3.0
import QtQuick 2.0
import "../common"

SceneBase{
    id: explainScene

    Rectangle {
        id: explain_rectangle
        anchors.fill: parent.gameWindowAnchorItem
        color:"white"

        Text{
            id:showtext
            anchors.fill: parent
            anchors.centerIn: parent.Center
            font.pixelSize: 12
            text: "1.Through the computer keyboard up and down around the key to achieve the player's\n direction control.\n
2.Gold coins, flowers, and snowballs are hidden in the bricks, \n
and players need to hit the bricks to get the relevant functions:\n
         (1)Snowball: players can get bigger and gain one life, be hit by monsters\n
         or fall into traps, players only become smaller and never die.\n
         (2)Flowers: Players can become invincible in a short time.\n"
        }
    }

    // back button to leave scene
    MenuButton {
        text: "Back"


        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device.

        anchors.right: explainScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.bottom: explainScene.gameWindowAnchorItem.bottom
        anchors.bottomMargin: 10
        onClicked: backButtonPressed()
    }
}
