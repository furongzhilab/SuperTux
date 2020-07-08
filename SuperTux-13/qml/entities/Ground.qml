import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: ground
    entityType: "ground"

    Row {
//        Image{
//            id:left_ground
//            source:"../../assets/gamescene/ground_left.png"
//            width: 64
//            height: 64
//        }
        Repeater {
            id: mid_ground
            model: size
            Image{
                source:"../../assets/gamescene/ground_mid.png"
                width: 64
                height: 64
            }
        }
//        Image{
//            id:right_ground
//            source:"../../assets/gamescene/ground_right.png"
//            width: 64
//            height: 64
//        }
    }

    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
        // Category5: solids
        categories: Box.Category5
        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "penguin") {
                penguin.contacts++
                if(penguin.verticalVelocity >= 0)
                    penguin.doubleJumpEnabled = true
            }
        }
        fixture.onEndContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "penguin") penguin.contacts--
        }
    }
}

