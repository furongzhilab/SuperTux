import QtQuick 2.0
import Felgo 3.0

Monster {
    id: monsterIce
    variationType: "monsterIce"

    property alias sprite: iceSprite
    property alias collider: collider
    // this property determines in which the monster moves
    // (-1 = left, 1 = right)
    property int direction: 1

    // the moving speed of the monster
    property int speed: 60
    property alias dieIce: dieSprite

    // set image
    TexturePackerAnimatedSprite {
        id: iceSprite
        source: "../../assets/ice_opponent/sprite/ice.json"
        frameNames: ["left-0.png", "left-1.png", "left-2.png"]
        interpolate: false
        frameRate: 10                  //control frequency
        x: -1
        y: -8
    }

    Image {
        id: imageIce
        TexturePackerAnimatedSprite {
            id: dieSprite
            source: "../../assets/ice_opponent/sprite/ice_die.json"
            frameNames: ["gmelting-0.png", "gmelting-1.png", "gmelting-2.png", "gmelting-3.png", "gmelting-4.png"]
            interpolate: false
            frameRate: 3        //control frequency
        }
    }

    // mirror sprite, when the monster is moving right
    image.mirror: collider.linearVelocity.x < 0 ? false : true

    // When this monster dies, we reset it's abyssChecker's
    // contacts to zero. Otherwise, after a level reset,
    // the abyssCheckers might not start with 0 contacts.
    onAliveChanged: {
        if(!alive) {
            leftAbyssChecker.contacts = 0
            rightAbyssChecker.contacts = 0
        }
    }

    // When being moved to the entity pool, reset the abyss checker's contacts.
    // For more information on entity pooling have a look at:
    // https://felgo.com/doc/felgo-entitybase/#poolingEnabled-prop
    onMovedToPool: {
        leftAbyssChecker.contacts = 0
        rightAbyssChecker.contacts = 0
    }

    // the monster main collider
    BoxCollider {
        id: collider

        anchors.fill: iceSprite

        // the bodyType is dynamic
        bodyType: Body.Dynamic

        // the collider should not be active in edit mode or
        // when dead
        active: !alive ? false : true

        // Category3: monster body
        categories: Box.Category3
        // Category1: player body, Category2: player feet sensor,
        // Category5: solids
        collidesWith: Box.Category1 | Box.Category2 | Box.Category5 | Box.Category3

        // set the monster's velocity
        linearVelocity: Qt.point(direction * speed, 0)

        onLinearVelocityChanged: {
            // if the opponent stops moving, reverse direction
            if(linearVelocity.x === 0)
                direction *= -1

            // make sure the speed is constant
            linearVelocity.x = direction * speed
        }
        fixture.onBeginContact: {
            var otherEntity = other.getBody().target
            if(otherEntity.entityType === "monster") {
                direction *= -1
                // make sure the speed is constant
                linearVelocity.x = direction * speed
            }
            else if(otherEntity.entityType === "spikes") {
                die()
            }
        }
    }

    // The abyss checkers check for abysses left and right of the
    // monster. With this, we can let the monster change direction,
    // before it would fall of an edge.
    BoxCollider {
        id: leftAbyssChecker

        // only active, when the main collider is active
        active: collider.active

        // we make it rather small
        width: 5
        height: 5

        // place it left, below the monster
        anchors.top: iceSprite.bottom
        anchors.left: iceSprite.left

        // Category4: monster sensor
        categories: Box.Category4
        // Category5: solids
        collidesWith: Box.Category5

        // this collider should only check for collisions
        collisionTestingOnlyMode: true

        // This property keeps track of the contacts. If contacts
        // is 0, there is an abyss and the opponent should reverse
        // it's direction.
        property int contacts: 0

        // handle number of contacts
        fixture.onBeginContact: contacts++
        fixture.onEndContact: if(contacts > 0) contacts--

        // change direction when there are no contacts
        onContactsChanged: if(contacts == 0) direction *= -1
    }
    BoxCollider {
        id: rightAbyssChecker

        active: collider.active

        // size and position
        width: 5
        height: 5
        anchors.top: iceSprite.bottom
        anchors.right: iceSprite.right

        // Category4: monster sensor
        categories: Box.Category4
        // Category5: solids
        collidesWith: Box.Category5

        collisionTestingOnlyMode: true

        // handle contacts
        property int contacts: 0

        fixture.onBeginContact: contacts++
        fixture.onEndContact: if(contacts > 0) contacts--

        onContactsChanged: if(contacts == 0) direction *= -1
    }

    // when the speed is changed, via the itemEditor, we also want to update
    // the opponents velocity
    onSpeedChanged: {
        collider.linearVelocity.x = direction * speed
    }

    Timer {
        id: hideTimer
        interval: 1000

        onTriggered: dieSprite.visible = false
    }

    function die() {
        alive = false
        dieSprite.visible = true
        hideTimer.start()

        iceSprite.visible = false
        audioManager.playSound("monsterIceDie")
    }

    //reset the opponent
    function reset() {
        // this is the reset function of the base entity Opponent.qml
        reset_super()

        // reset direction
        direction = -1

        // reset force
        collider.linearVelocity.x = Qt.point(direction * speed, 0)
    }
}

