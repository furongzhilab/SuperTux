import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: brick
    entityType: "brick"

    // this property is true when the player collected the coin
    property bool hited: false

    // define colliderComponent for collision detection while dragging
    colliderComponent: collider

    // set image
    Image {
        id: image
        source: "../../assets/brick/brick.png"
    }

    BoxCollider {
        anchors.fill: image
        bodyType: Body.Static
        active: !hited

        // Category6: powerup
        categories: Box.Category6
    }

    // set collected to true
    function hit() {
        console.debug("hit brick.")
        hited = true
        image.visible = !hited

        audioManager.playSound("hitBrick")
    }
    // reset brick
    function reset() {
        hited = false
        image.visible = true
    }
}
