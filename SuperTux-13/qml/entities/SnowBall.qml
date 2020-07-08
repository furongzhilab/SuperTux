import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: snowball
    entityType: "snowball"

    // this property is true when the player collected the coin
    property bool hited: false
    property bool hadhited: false
    property int speed: 48

    // define colliderComponent for collision detection while dragging
    colliderComponent: collider
    visible: false//hited
    property int time: 1


    TexturePackerAnimatedSprite {
        id: image
        source: "../../assets/bouncing_snowball/sprite/snowball.json"
        frameNames: ["left-0.png","left-1.png","left-2.png",
            "left-3.png","left-4.png","left-5.png" ]
        interpolate: false
        frameRate: 13                  //control frequency
    }

    BoxCollider {
       anchors.fill: image
        bodyType: Body.Dynamic
        fixedRotation: true
        active: !hited

        // Category6: powerup
        categories: Box.Category6
        collidesWith: Box.Category1 | Box.Category6 | Box.Category5
        linearVelocity: Qt.point(speed, 0)
        onLinearVelocityChanged: {
            // if the opponent stops moving, reverse direction
            if(linearVelocity.x === 0)

             console.log(snowball.x,snowball.y)

            // make sure the speed is constant
            linearVelocity.x = speed
            console.log(snowball.x,snowball.y)
        }

    }

//    // set collected to true
    function collect() {
        console.debug("hit ball.")
        hited = true
        visible = false
        hadhited = true
    }

    // reset snowball
    function reset() {
        hited = false
        visible = false
        x=startX
        y=startY
        hadhited = false
    }
}
