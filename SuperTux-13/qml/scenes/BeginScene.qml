import Felgo 3.0
import QtQuick 2.0
import QtMultimedia 5.0

SceneBase{
    id:beginScene

    // duration of the game in seconds
    property int time : 5
    // indicates if game is running
    property bool imageRunning: false

    Rectangle {
        id: rectangle
        anchors.fill: parent.gameWindowAnchorItem

        Item{
            id:background
            anchors.fill: parent

            Image{
                id: background_image1
                anchors.fill: parent
                source: "../../assets/background/start_background.jpg"
            }
            Image{
                id: background_image2
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../../assets/background/logo.png"
                width: 150
                height:100
            }
        }
    }

    // image timer, default interval of Timer is 1 second
    Timer {
        id: imageTimer
        running: true
        repeat: true
        onTriggered: {
            time--
            if(time === 0) {
                imageRunning = false
                gameWindow.state = "menu"
            }
        }
    }
}
