import QtQuick 2.0
import Felgo 3.0


// this is the base class for all monsters
PlatformerEntityBaseDraggable{
    id: monster
    entityType: "monster"

    // the monster's start position
    // These are the coordinates, to which the opponent gets reset,
    // when resetting the level.

    property int contacts: 0
    // this is true while the monster is alive
    property bool alive: true

    // After an monster dies, we want to show it's dead-sprite for a short
    // time, and then hide it.
    // If this property is true, the opponent is invisible.
    property bool hidden: false

    z: 1 // to make opponent appear in front of the platforms

    // set the monster's size to it's sprite's size
    width: image.width
    height: image.height

    // hide monster after its death
    image.visible: !hidden

    // update the entity's start position when the entity is created or moved
    onEntityCreated: updateStartPosition()
    onEntityReleased: updateStartPosition()

    // this timer hides the opponent a few seconds after its death
    Timer {
      id: hideTimer
      interval: 2000

      onTriggered: hidden = true
    }

    function updateStartPosition()
    {
        startX = x
        startY = y
    }

    // this function resets all properties, which all monsters have in common
    function reset_super()
    {
        // reset alive property
        alive = true

        // stop hideTimer, to avoid unwanted, delayed hiding of the monster
        hideTimer.stop()
        // reset hidden
        hidden = false

        // reset position
        x = startX
        y = startY

        if(alive) {
            sprite.visible = true
            image.visible = false
        }

        // reset velocity
        collider.linearVelocity.x = 0
        collider.linearVelocity.y = 0

        // reset force
        collider.force = Qt.point(0, 0)
    }

    function die() {
      alive = false

      hideTimer.start()

      if(variationType == "monsterIce")
        audioManager.playSound("monsterIceDie")
      else if(variationType == "monsterRed")
        audioManager.playSound("monsterIceDie")
      else if(variationType == "monsterRebot")
        audioManager.playSound("monsterRebotDie")
      else if(variationType == "monsterSnow")
        audioManager.playSound("monsterIceDie")
      else if(variationType == "monsterBomb")
        audioManager.playSound("monsterBombDie")
      // for every killed opponent, the time gets set back a little bit
      gameScene.time -= 5
    }
}
