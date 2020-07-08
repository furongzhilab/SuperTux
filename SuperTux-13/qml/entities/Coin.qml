import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: coin
    entityType: "coin"

    // this property is true when the player collected the coin
    property bool collected: false
    property bool isBrickCoin: false
    property bool hadhited: false
    property alias coin_sprite: coinSprite
    property int time: 1
    visible: isBrickCoin ? true : false

    // define colliderComponent for collision detection while dragging
    colliderComponent: collider

    // set image
    TexturePackerAnimatedSprite {
        id: coinSprite
        source: "../../assets/coin/sprite/coin.json"
        frameNames: ["coin-0.png", "coin-1.png", "coin-2.png",
            "coin-3.png", "coin-4.png", "coin-5.png", "coin-6.png",
            "coin-7.png", "coin-10.png","coin-9.png", "coin-8.png",
            "coin-11.png", "coin-12.png", "coin-13.png", "coin-14.png", "coin-15.png"]
        interpolate: false
        frameRate: 16                  //control frequency
        x: -8
        y: -18
    }

    Timer {
        id: block_coin
        repeat: false
        running: true

        onTriggered: {
            time--
            if(isBrickCoin) {
                coinSprite.visible = !collected
            }
        }
    }

    CircleCollider {
        id: collider

        // make the collider a little smaller than the sprite
        radius: coinSprite.width - 15

        anchors.left: coinSprite.left
        anchors.top: coinSprite.top

        // disable collider when coin is collected
        active: !collected

        // the collider is static (shouldn't move) and should only test
        // for collisions
        bodyType: Body.Static
        collisionTestingOnlyMode: true

        // Category6: powerup
        categories: Box.Category6
        // Category1: player body
        collidesWith: Box.Category1
    }

    Block {
        id: coinBlock
    }

    // set collected to true
    function collect() {
        console.debug("collect coin")
        collected = true
        block_coin.start()
        coinSprite.visible = collected
        hadhited = true
        audioManager.playSound("coin")
    }

    // reset coin
    function reset() {
        collected = false
        x=startX
        y=startY
        hadhited = false
        isBrickCoin = false
   }
}
