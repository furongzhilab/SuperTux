import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: house
    entityType: "house"

    Image {
        id: houseGoal
        source: "../../assets/snowhouse/house.png"
        width: 360
        height: 240
    }

    BoxCollider {
        anchors.fill: houseGoal
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
