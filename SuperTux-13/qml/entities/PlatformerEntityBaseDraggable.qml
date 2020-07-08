import QtQuick 2.12
import Felgo 3.0

EntityBaseDraggable {
    id: entityBase

    property double column: 0
    property double row: 0
    property double size
    property double startX
    property double startY

    width: gameScene.gridSize*size
    height: gameScene.gridSize

    MultiResolutionImage {
        id: sprite
        width: 32
        height: 32
    }

    // instead of directly modifying the x and y values of your tiles, we introduced rows and columns for easier positioning, have a look at Level1.qml on how they are used
    x: row*gameScene.gridSize
    y: level.height - (column+1)*gameScene.gridSize

    // this is the scene this entity is in
    // NOTE: if your scene's id is NOT gameScene change this to make it fit to your implementation
    property var scene: gameScene

    // alias, to be able to access the sprite from the outside
    property alias image: sprite
}

