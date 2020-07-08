import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
  id: spikes
  entityType: "spikes"
  variationType: "up"

  // set the size to the sprite's size
  width: image.width
  height: image.height

  // define colliderComponent for collision detection while dragging
  colliderComponent: collider

  Row {
      Repeater {
          id: mid_ground
          model: size
          Image{
              source: "../../assets/spike/spike-up.png"
              width: 32
              height: 32
          }
      }
  }

  BoxCollider {
    id: collider

    // set the collider's size to fit to the sprite
    width: parent.width * 6
    height: parent.height / 2 + 1

    // set position
    anchors.left: parent.left
    anchors.bottom: parent.bottom

    // the bodyType is static
    bodyType: Body.Static

    // the collider should not be active in edit mode
    active: !inLevelEditingMode

    // Category5: solids
    categories: Box.Category5
    // Category1: player body, Category2: player feet sensor,
    // Category3: monster body
    collidesWith: Box.Category1 | Box.Category2 | Box.Category3
  }
}

