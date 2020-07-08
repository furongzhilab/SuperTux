import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: excbrick
    entityType: "excbrick"

    // this property is true when the player collected the coin
    property bool hited: false
    property bool smashed: false

    // when the coin is collected, it shouldn't be visible anymore
    image.visible: !hited

    // define colliderComponent for collision detection while dragging
    colliderComponent: collider
    property int time: 5

    // set image
    Image {
        id: image
        source: "../../assets/brick/tip_block.png"
    }


    BoxCollider {
        anchors.fill: image
        bodyType: Body.Static

        // Category6: powerup
        categories: Box.Category6
    }

    Rectangle{
        id:show
        anchors.bottom: excbrick.top
        width: 310
        height: 80
        radius: 10
        color:"#236B8E"
        opacity: 0.5
        visible: hited

        Text{
            id:showtext
            anchors.fill: parent
            anchors.centerIn: parent.Center
            font.pixelSize: 16
            text: "Hitting the question mark brick yields gold \nCOINS, snowballs and flowers. Get a snowball \ncan be big, get flowers can be invincible!
"
        }

        Timer{
            id:visiable_excbrick
            running: hited
            repeat: true

            onTriggered: {
                time--
                if(time == 0){
                    show.visible=false
                }
            }
        }
    }

    // set collected to true
    function hit() {
        console.debug("hit brick.")
        hited = true

        audioManager.playSound("hitBrick")
    }

    function text(){
        show.visible=hited
    }

    // reset coin
    function reset() {
         hited= false
         smashed= false
         time=5
    }
}
