import QtQuick 2.0
import Felgo 3.0


PlatformerEntityBaseDraggable {
  id: trampoline
  entityType: "trampoline"

  // define colliderComponent for collision detection while dragging
  colliderComponent: collider

  property bool touch: false

  width: 30
  height: 60

  // set image
  image.source: touch ? "../../assets/helpjump/trampoline1-0.png"
                      : "../../assets/helpjump/trampoline1-3.png"

  BoxCollider {
    id: collider

    // make the collider a little smaller than the sprite
    width: parent.width
    height: 1

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.top

    // the collider is static (shouldn't move) and only test
    // for collisions
    bodyType: Body.Dynamic
    collisionTestingOnlyMode: false

    // Category6: powerup
    categories: Box.Category6
    // Category1: player body, Category2: player feet sensor,
    collidesWith: Box.Category1 | Box.Category2
  }

  SequentialAnimation {
      id: mushroomAnimation
      NumberAnimation {
          target: trampoline
          property: "y"
          from: 288
          to: 300
          loops: Animation.Infinite
      }
  }

  function touchHead() {
      trampoline.touch = true

      console.debug("jump from trampoline")
      audioManager.playSound("trampoline")
  }

    // reset trampoline
    function reset() {
      trampoline.touch = false
    }
}
