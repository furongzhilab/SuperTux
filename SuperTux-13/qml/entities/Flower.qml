import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: flower
    entityType: "flower"

    // this property is true when the player collected the coin
    property bool eated: false
    property bool isBrickFlower: false
    property bool hadhited: false
    property alias flower_sprite: flowerSprite
    visible: isBrickFlower ? true : false

    // define colliderComponent for collision detection while dragging
    colliderComponent: collider

    // set image
    TexturePackerAnimatedSprite {
        id: flowerSprite
        source: "../../assets/fireflower/sprit/fireflower.json"
        frameNames: ["fire_flower-0.png", "fire_flower-1.png",
            "fire_flower-2.png", "fire_flower-3.png", ]
        interpolate: false
        frameRate: 16                  //control frequency
        x: -8
        y: -18
    }

    BoxCollider {
        id: collider
        width: flowerSprite.width
        height: flowerSprite.height

        anchors.left: flowerSprite.left
        anchors.top: flowerSprite.top

        // disable collider when coin is collected
        active: !eated

        // the collider is static (shouldn't move) and should only test
        // for collisions
        bodyType: Body.Static
        collisionTestingOnlyMode: true

        // Category6: powerup
        categories: Box.Category6
        // Category1: player body
        collidesWith: Box.Category1
    }

    // set collected to true
    function eat() {
        console.debug("eat flower")
        eated = true
//        block_flower.start()
        flowerSprite.visible = !eated
        hadhited = true
        penguin.invincible = true
        audioManager.playSound("flower")
    }

    // reset star
    function reset() {
        eated = false
        x=startX
        y=startY
        hadhited = false
        isBrickFlower = false
        flowerSprite.visible = true
    }
}
