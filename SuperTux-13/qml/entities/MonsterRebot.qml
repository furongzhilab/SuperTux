import QtQuick 2.0
import Felgo 3.0

Monster {
    id: monsterRebot
    variationType: "monsterRebot"

    property alias sprite: rebotSprite
    property alias collider: collider
    // this property determines in which the monster moves
    // (-1 = left, 1 = right)
    property int direction: 1

    // the moving speed of the monster
    property int speed: 50

    // the opponents jumpForce in vertical and horizontal
    // direction
    property int verticalJumpForce: 450
    property int horizontalJumpForce: 40

    // set image
    // if monster is alive, use normal sprite,
    // else, use dead sprite
    TexturePackerAnimatedSprite {
        id: rebotSprite
        source: "../../assets/opponent1/sprite/rebot.json"
        frameNames: ["left-0.png", "left-1.png"]
        interpolate: false
        frameRate: 10                  //control frequency
        x: -1
        y: -8
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
            jumpTimer.stop()
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

        anchors.fill: rebotSprite
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
                direction *= 1

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
        anchors.top: parent.bottom
        anchors.left: parent.left

        // Category4: monster sensor
        categories: Box.Category4
        // Category5: solids
        collidesWith: Box.Category5

        // this collider should only check for collisions
        collisionTestingOnlyMode: false

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
        anchors.top: parent.bottom
        anchors.right: parent.right

        // Category4: opponent sensor
        categories: Box.Category4
        // Category5: solids
        collidesWith: Box.Category5

        collisionTestingOnlyMode: false

        // handle contacts
        property int contacts: 0

        fixture.onBeginContact: contacts++
        fixture.onEndContact: if(contacts > 0) contacts--

        onContactsChanged: if(contacts == 0) direction *= -1
    }

    BoxCollider {
      id: bottomSensor

      // set size and position
      width: 5
      height: 5

      anchors.horizontalCenter: parent.horizontalCenter
      anchors.top: parent.bottom

      // the bodyType is dynamic
      bodyType: Body.Dynamic

      // only active when the main collider is active
      active: collider.active

      // Category4: opponent sensor
      categories: Box.Category4
      // Category5: solids
      collidesWith: Box.Category5

      // this collider is for collision testing only
      collisionTestingOnlyMode: true

      // this is called whenever the contact with another entity begins
      fixture.onContactChanged: {
        var otherEntity = other.getBody().target

        // When the opponent stands on a solid object, we want it
        // to wait a little and then jump again.
        // Since we set the collidesWith property, we can be sure
        // that it won't collide with any unwanted entities.
        if(collider.linearVelocity.y === 0 && !jumpTimer.running)
          jumpTimer.start()
      }
    }

    // this timer is started in the bottomSensor and makes the opponent jump
    // when triggered
    Timer {
      id: jumpTimer

      interval: 300

      onTriggered: {
        // jump in the current direction
        collider.applyLinearImpulse(Qt.point(direction * horizontalJumpForce, -verticalJumpForce))

        // alternate direction after every jump
        direction *= -1
      }
    }

    // when the speed is changed, via the itemEditor, we also want to update
    // the opponents velocity
    onSpeedChanged: {
        collider.linearVelocity.x = direction * speed
    }

    // this timer hides the opponent a few seconds after its death
    Timer {
      id: hideTimer
      interval: 2000

      onTriggered: hidden = true
    }

    function die() {
        alive = false
        image.source = "../../assets/opponent1/squished-left.png"
        hideTimer.start()

        rebotSprite.visible = false
        audioManager.playSound("monsterRebotDie")
    }



    // reset the opponent
    function reset() {
        // this is the reset function of the base entity Opponent.qml
        reset_super()

        // reset direction
        direction = -1

        // reset force
        collider.linearVelocity.x = Qt.point(direction * speed, 0)
    }
}

