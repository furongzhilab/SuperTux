import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: signFlower
    entityType: "signFlower"

    property alias flowertux: flowertux

    Image {
        id: flowertux

        property double row: 0
        property double column: 0

        source: "../../assets/sign/fireflower_sign.png"
        width: 230
        height: 140
    }
}
