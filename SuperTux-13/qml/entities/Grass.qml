import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: grass
    entityType: "grass"

    Row {
        Repeater {
            id: ground_ice
            model: size
            Image {
                source: "../../assets/gamescene/grass.png"
                width: 26
                height: 26
            }
        }
    }
}

