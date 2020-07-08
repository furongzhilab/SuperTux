import Felgo 3.0
import QtQuick 2.12

PlatformerEntityBaseDraggable {
    id: penguin
    entityType: "penguin"
    property alias player: penguin

    // add some aliases for easier access to those properties from outside
    property alias collider: collider
    property alias horizontalVelocity: collider.linearVelocity.x
    property alias verticalVelocity: collider.linearVelocity.y

    // the number of collected coins
    property int score: 0

    // if this is true, the player can jump once, without touching the ground
    property bool doubleJumpEnabled: true

    // if isBig is true, the player sprite is higher, and the
    // player touch one enemy/spike without dying (like in Super Mario games)
    property bool isBig: false

    // if true, the player is invincible
    property bool invincible: false

    // the time in ms, the player is invincible, after collecting a star
    property int starInvincibilityTime: 7000

    // the contacts property is used to determine if the player is in touch with any solid objects (like ground or platform), because in this case the player is walking, which enables the ability to jump. contacts > 0 --> walking state
    property int contacts: 0
    // property binding to determine the state of the player like described above
    state: contacts > 0 ? "walking" : "jumping"
    onStateChanged: console.debug("penguin.state " + state)

    // This property holds how many more iterations the player's
    // jump height can increase. We use this to control the jump height.
    // See the ascentControl Timer for more details.
    property int jumpForceLeft: 20

    // the player's accelerationForce
    property int accelerationForce: 500

    // the factor by how much the player's speed decreases when
    // the user stops pressing left or right
    property real decelerationFactor: 0.6

    // the player's maximum movement speed
    property int maxSpeed: 300

    // maximum falling speed
    property int maxFallingSpeed: 700

    // these properties set the player's jump force for normal- and
    // kill-jumps
    property int normalJumpForce: 200
    property int killJumpForce: 340

    // make player smaller, if isBig is false
    scale: isBig ? 1 : 0.64
    // animate scale changes
    Behavior on scale { NumberAnimation { duration: 500 } }

    Image {
        id: penguin_pic
        anchors.fill: parent.gameWindowAnchorItem
        source: invincible ? "../../assets/penguin/sprite/fire_stand.png"
                           : "../../assets/penguin/sprite/stand-0.png"
        width: 80
        height: 70
    }

    // limit falling speed
    onVerticalVelocityChanged: {
        if(verticalVelocity > maxFallingSpeed)
            verticalVelocity = maxFallingSpeed
    }

    ResetSensor
    {
        id:resensor
    }

    /**
     * Colliders ---------------------------------------
     */
    PolygonCollider {
        id: collider
        anchors.fill: penguin_pic
        vertices: isBig ?
                      [
                          Qt.point(6, 69),
                          Qt.point(6, 12),
                          Qt.point(71, 12),
                          Qt.point(71, 69),
                      ] :
                      [
                          Qt.point(5, 44),
                          Qt.point(5, 8),
                          Qt.point(46, 8),
                          Qt.point(46, 44),
                      ]
        // anchors.horizontalCenter: parent.horizontalCenter
        // this collider must be dynamic because we are moving it by applying forces and impulses
        bodyType: Body.Dynamic // this is the default value but I wanted to mention it ;)
        fixedRotation: true // we are running, not rolling...

        // Category1: player body
        categories: Box.Category1
        // Category3: monster body, Category5: solids,
        // Category6: powerups, Category7: reset sensor
        collidesWith: Box.Category3 | Box.Category5 | Box.Category6 | Box.Category7

        // we set friction to zero to make the player slide down the sides of other entities
        friction: 0

        sleepingAllowed: false
        // apply the horizontal value of the TwoAxisController as force to move the player left and right
        force: Qt.point(controller.xAxis * accelerationForce, 0)

        // limit the horizontal velocity
        onLinearVelocityChanged: {
            if(linearVelocity.x > maxSpeed) linearVelocity.x = maxSpeed
            if(linearVelocity.x < - maxSpeed) linearVelocity.x = -maxSpeed
        }

        // this is called whenever the contact with another entity begins
        fixture.onBeginContact: {
            var otherEntity = other.getBody().target

            // on contact with a coin, collect it and increase score
            if(otherEntity.entityType === "coin") {
                otherEntity.collect()

                score += 1
            }
            if(otherEntity.entityType === "coinGround") {
                otherEntity.collect()

                score += 1
            }
            else if(otherEntity.entityType === "flower") {
                otherEntity.eat()

                // make invincible
                startInvincibility(starInvincibilityTime)
            }
            else if(otherEntity.entityType === "snowball") {
                otherEntity.collect()
                // make big
                isBig = true
            }
            else if(otherEntity.entityType === "brick") {
                penguin.contacts++
            }
            else if(otherEntity.entityType === "house") {
                penguin.contacts++
                gameWindow.state = "level"
                win()
            }
        }

        // this is called whenever the contact with another entity changes
        fixture.onContactChanged: {
            var otherEntity = other.getBody().target

            // on contact with an monster or spikes, call the cat_die() function
            if(otherEntity.entityType === "monster" || otherEntity.entityType === "spikes") {
                die(false)
                audioManager.playSound("penguinHurt")
            }
        }
    }

    // this collider handles contacts and the killing of opponents
    BoxCollider {
        id: feetSensor

        // set and adjust size, depending on player size (big or small)
        width: isBig ? collider.width - 18 : collider.width / 2
        height: 4

        // set position
        anchors.left: collider.left
        anchors.leftMargin: 6
        anchors.top: collider.bottom
        anchors.topMargin: isBig ? -4 : -28

        // the bodyType is dynamic
        bodyType: Body.Dynamic

        // Category2: player feet sensor
        categories: Box.Category2
        // Category3: monster body, Category6: powerup
        collidesWith: Box.Category3 | Box.Category6

        // this is only a sensor, so it should not physically collide
        // with any other object
        collisionTestingOnlyMode: true
        active: true

        // this is called whenever the contact with another entity begins
        fixture.onBeginContact: {
            var otherEntity = other.getBody().target

            // if colliding with monster...
            if(otherEntity.entityType === "monster") {
                // ...calculate the lowest point of the player and
                // the monster...
                var playerLowestY = penguin.y + penguin.height
                var monLowestY = otherEntity.y + otherEntity.height

                // ...and if the player's y position is at least
                // 5px above the monster's...
                if(playerLowestY < monLowestY - 5) {
                    // ...kill monster...
                    console.debug("kill monster")
                    otherEntity.die()

                    // ...and jump in the air
                    jump(false)
                }
            }

            else if(otherEntity.entityType === "trampoline") {
                var penguinLowestY = penguin.y + penguin.height
                var mushLowestY = otherEntity.y + otherEntity.height

                // ...and if the player's y position is at least
                // 1px above the trampoline's...
                if(penguinLowestY < mushLowestY) {
                    otherEntity.touchHead()
                    // ...and jump in the air
                    jump(false)
                }
            }
        }
    }

    // this collider handles contacts and the killing of opponents
    BoxCollider {
        id: headSensor

        // set and adjust size, depending on player size (big or small)
        width: isBig ? collider.width - 18 : collider.width / 2
        height: 4

        // set position
        anchors.left: collider.left
        anchors.leftMargin: 6
        anchors.bottom: collider.top
        anchors.bottomMargin: isBig ? -12 : -10

        // the bodyType is dynamic
        bodyType: Body.Dynamic

        // Category2: player head sensor
        categories: Box.Category4
        // Category6: powerup
        collidesWith: Box.Category6

        // this is only a sensor, so it should not physically collide
        // with any other object
        collisionTestingOnlyMode: true

        // this is called whenever the contact with another entity begins
        fixture.onBeginContact: {
            var otherEntity = other.getBody().target

            if(otherEntity.entityType === "brick") {
                contacts++
                otherEntity.hit()
                audioManager.playSound("hitbrick")
            }
            else if(otherEntity.entityType === "block") {
                contacts++
                otherEntity.hit()
                audioManager.playSound("hitblock")
            }
            else if(otherEntity.entityType === "excbrick") {
                contacts++

                otherEntity.hit()
                otherEntity.text()
            }
        }
    }

    // this timer is used to slow down the players horizontal movement. the linearDamping property of the collider works quite similar, but also in vertical direction, which we don't want to be slowed
    Timer {
        id: updateTimer
        // set this interval as high as possible to improve performance, but as low as needed so it still looks good
        interval: 60
        running: true
        repeat: true
        onTriggered: {
            var xAxis = controller.xAxis;
            // if xAxis is 0 (no movement command) we slow the player down until he stops
            if(xAxis === 0) {
                if(Math.abs(penguin.horizontalVelocity) > 10) penguin.horizontalVelocity /= 1.5
                else penguin.horizontalVelocity = 0
            }
        }
    }

    /**
     * Invincibility ------------------------------------------------------
     */

    // this is the overlay image, that signals, that the player is invincible
    MultiResolutionImage {
        id: invincibilityOverlayImage
        //        source: "../../assets/penguin/sprite/fire_stand.png"

        opacity: 0

        // this animation fades out the incibility overlay, to signal, that
        // the invincibility will end soon
        NumberAnimation on opacity {
            id: invincibilityOverlayImageFadeOut

            // slowly reduce opacity from 1 to 0
            from: 1
            to: 0

            // duration of the animation, in ms
            duration: 500
        }
    }

    // this timer is triggered shortly before invincibility ends, to signal,
    // that it will end soon
    Timer {
        id: invincibilityWarningTimer

        onTriggered: warnInvincibility()
    }

    // as long as this timer is running, the player is invincible
    // when it is triggered, invincibility ends
    Timer {
        id: invincibilityTimer

        onTriggered: endInvincibility()
    }

    // The ascentControl allows the player to jump higher, when pressing the
    // jump button longer, and lower, when pressing the jump button shorter.
    // It is running while the player presses the jump button.
    Timer {
        id: ascentControl

        // every 15 ms this is triggered
        interval: 15
        repeat: true

        onTriggered: {
            // If jumpForceLeft is > 0, we set the players verticalVelocity to make
            // him jump.
            if(jumpForceLeft > 0) {

                var verticalImpulse = 0

                // At the beginning of the jump we set the verticalVelocity to 0 and
                // apply a high vertical impulse, to get a high initial vertical
                // velocity.
                if(jumpForceLeft == 20) {
                    verticalVelocity = 0

                    verticalImpulse = -normalJumpForce
                }
                // After the first strong impulse, we only want to increase the
                // verticalVelocity slower.
                else if(jumpForceLeft >= 14) {
                    verticalImpulse = -normalJumpForce / 5
                }
                // Then, after about a third of our maximum jump time, we further
                // reduce the verticalImpulse.
                else {
                    verticalImpulse = -normalJumpForce / 15
                }
                // Reducing the verticalImpulse over time allows for a more precise
                // controlling of the jump height.
                // Also it gives the jump a more natural feeling, than using a constant
                // value.

                // apply the impulse
                collider.applyLinearImpulse(Qt.point(0, verticalImpulse))

                // decrease jumpForceLeft
                jumpForceLeft--
            }
        }
    }

    /**
     * Game related JS functions --------------------------------------------------
     */

    // This function is called, when the user presses the jump button or, when
    // the player jumps on an opponent.
    // isNormalJump is true, when the user pressed the jump button.
    // When jumping after a kill jump, isNormalJump is false.
    function jump(isNormalJump) {
        if(isNormalJump) {
            // when the player stands on the ground and the jump
            // button is pressed, we start the ascentControl
            if(penguin.state == "walking") {
                ascentControl.start()
            }
            // if doubleJumpEnabled, the player can also jump without
            // standing on the ground
            else if(doubleJumpEnabled) {
                ascentControl.start()
                doubleJumpEnabled = false
            }
        }
        else {
            // When killing an monster, we want the player to jump
            // a little. We do that by just setting the verticalVelocity
            // to a negative value.
            verticalVelocity = -killJumpForce
        }
    }

    // this function is called, when the user releases the jump button
    function endJump() {
        // stop ascentControl
        ascentControl.stop()

        // reset jumpForceLeft
        jumpForceLeft = 20
    }

    function die(dieImmediately) {
        // if dieImmediately is true OR
        // the player is (NOT big AND NOT invincible)...
        if(dieImmediately || (!isBig && !invincible))
        {
            // ...die
            audioManager.playSound("penguinDie")
            resensor.contact()

            score= 0

            collider.linearVelocity.x = 0
            collider.linearVelocity.y = 0

            score = 0

            doubleJumpEnabled = true

            // reset isBig
            isBig = false

            // reset invincibility
            invincible = false
            invincibilityTimer.stop()
            invincibilityWarningTimer.stop()
            invincibilityOverlayImage.opacity = 0

            invincible= false
            feetSensor.active=true
            gameScene.resetLevel()
        }
        // else if invincible...
        else if(invincible) {
            // ... don't do anything
        }
        // else => (!dieImmediately && !invincible && isBig)...
        else {
            // ...make player small and invincible for a short time
            isBig = false
            startInvincibility(0)
        }
    }
    function startInvincibility(interval) {
        // this is the time the player is warned, that the invincibility will
        // end soon
        var warningTime = 500

        // the interval (invincibility time) must be at least as long as the
        // warning time
        if(interval < warningTime)
            interval = warningTime

        // show invincibility overlay
        invincibilityOverlayImage.opacity = 1

        // Calculate and set time until the invincibility warning.
        // This value is at least 0.
        invincibilityWarningTimer.interval = interval - warningTime
        // start timer
        invincibilityWarningTimer.start()

        // Calculate and set time until the invincibility ends.
        // This value is at least warningTime.
        invincibilityTimer.interval = interval
        // start timer
        invincibilityTimer.start()

        // enable invincibility
        invincible = true

        console.debug("start invincibility; interval: "+interval)
    }

    function warnInvincibility() {
        // fade out the invincibilityOverlayImage
        invincibilityOverlayImageFadeOut.start()

        console.debug("warn invincibility")
    }

    function endInvincibility() {
        // disable invincibility again
        invincible = false

        console.debug("stop invincibility")
    }

    function win() {
        audioManager.playSound("win")
    }
}
