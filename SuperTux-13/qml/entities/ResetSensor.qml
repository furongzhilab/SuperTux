import Felgo 3.0
import QtQuick 2.0

EntityBase {
    id: resetSensor
    entityType: "resetSensor"
    signal contact

    BoxCollider {
        anchors.fill: parent
        collisionTestingOnlyMode: true
        categories: Box.Category7
        collidesWith: Box.Category1

        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "penguin") {

                resetSensor.contact()
            }
            gameScene.resetLevel()
        }
    }

    onContact:  {
        penguin.x = 0
        penguin.y = 400
    }
}

