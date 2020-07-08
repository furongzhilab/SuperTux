import Felgo 3.0
import QtQuick 2.0
import "../common"
import "../entities"
import "../levels"

SceneBase {
    id: gameScene

    width: 960
    height: 640
    gridSize: 64

    signal backPressed

    // score
    property int score: 0

    property int offsetBeforeScrollingStarts: 240
    property string activeLevelFileName
    property variant activeLevel
   // flag indicating if game is running
   property bool gameRunning: countdown == 0


    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(fileName) {
      activeLevelFileName = fileName
    }

    StateChangeScript {script: resetLevel()} // reset all entity positions

    EntityManager {
        id: entityManager
    }

    // the whole screen is filled with an incredibly beautiful blue ...
    Rectangle {
        anchors.fill: parent
        ParallaxScrollingBackground {
            sourceImage: "../../assets/background/game_background.png"

            anchors.fill: parent.gameWindowAnchorItem
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 60
            // we move the parallax layers at the same speed as the player
            movementVelocity: Qt.point(-20,0)
    //        movementVelocity: penguin.x > offsetBeforeScrollingStarts ? Qt.point(-penguin.horizontalVelocity,0) : Qt.point(0,0)
            // the speed then gets multiplied by this ratio to create the parallax effect
            ratio: Qt.point(0.3,0)
        }
        Item{
            anchors.fill: parent
            //back button to leave scene
            PauseButton{
                image_button.source:"../../assets/editor/scriptedobject.png"
                color:"lightpink"
                // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.top:parent.top
                anchors.topMargin: 10
                width: 40
                height: 40

                onClicked: {
                    onBackButtonPressed: gameWindow.state = "pause"
                }
            }
        }

    }

    // this is the moving item containing the level and player
    Item {
        id: viewPort
        height: level.height
        width: level.width
        anchors.bottom: gameScene.gameWindowAnchorItem.bottom
        x: penguin.x > offsetBeforeScrollingStarts ? offsetBeforeScrollingStarts-penguin.x : 0

        PhysicsWorld {
            id: physicsWorld
            gravity: Qt.point(0, 25)
//            debugDrawVisible: true // enable this for physics debugging
            z: 1000

            onPreSolve: {
                //this is called before the Box2DWorld handles contact events
                var entityA = contact.fixtureA.getBody().target
                var entityB = contact.fixtureB.getBody().target
                if(entityB.entityType === "platform" && entityA.entityType === "penguin" &&
                        entityA.y + entityA.height > entityB.y) {
                    //by setting enabled to false, they can be filtered out completely
                    //-> disable cloud platform collisions when the player is below the platform
                    contact.enabled = false
                }
            }
        }

//        // you could load your levels Dynamically with a Loader component here
//        Level1 {
//            id: level
//        }

        Loader{
            id:level
            source: activeLevelFileName != "" ? "../levels/" + activeLevelFileName : ""
            onLoaded: {
              // reset the score
              score = 0
              // since we did not define a width and height in the level item itself, we are doing it here
              item.width = gameScene.width
              item.height = gameScene.height
              // store the loaded level as activeLevel for easier access
              activeLevel = item
              // restarts the countdown
              countdown = 2
            }
        }

        Penguin {
            id: penguin
            x: 0
            y: 400
        }

        ResetSensor {
          width: penguin.width+10
          height: 30
          x: penguin.x
          y:gameWindow.height-30

          // if the player collides with the reset sensor, he goes back to the start
          onContact: {
            penguin.x = 0
            penguin.y = 400
          }

          Rectangle {
            anchors.fill: parent
            color: "red"
          }
        }
    }

    HUDIconAndText {
      id: scoreDisplay

      text: penguin.score
      icon.source: "../../assets/editor/coins-0.png"
    }

    // this button is for jumping on touch devices
//    JumpTouchButton {
//      id: jumpTouchButton

//      onPressed: penguin.jump(true)
//      onReleased: penguin.endJump()
//    }

//    Rectangle {
//        MultiPointTouchArea {
//            anchors.fill: parent
//            onPressed: {
//                if(touchPoints[0].x < width/2)
//                    controller.xAxis = -1
//                else
//                    controller.xAxis = 1
//            }
//            onUpdated: {
//                if(touchPoints[0].x < width/2)
//                    controller.xAxis = -1
//                else
//                    controller.xAxis = 1
//            }
//            onReleased: controller.xAxis = 0
//        }
//    }

    // on desktops, you can move the player with the arrow keys, on mobiles we are using our custom inputs above to modify the controller axis values. With this approach, we only need one actual logic for the movement, always referring to the axis values of the controller
    Keys.forwardTo: controller
    TwoAxisController {
        id: controller
        onInputActionPressed: {
            console.debug("key pressed actionName " + actionName)
            if(actionName == "up") {
                penguin.jump(true)
                audioManager.playSound("penguinJump")
            }
        }

        onInputActionReleased: {
          // end jump when releasing the up button
          if(actionName == "up") {
            penguin.endJump()
          }
        }
    }

    function resetLevel() {

        // reset monsters
        var monsters = entityManager.getEntityArrayByType("monster")
        for(var mon in monsters) {
            monsters[mon].reset()
        }

        // reset coins
        var coins = entityManager.getEntityArrayByType("coin")
        for(var coin in coins) {
            coins[coin].reset()
        }
        //reset coinGround
        var coinsGround = entityManager.getEntityArrayByType("coinGround")
        for(var coinGround in coinsGround) {
            coinsGround[coinGround].reset()
        }

        // reset exbrick
        var excbricks = entityManager.getEntityArrayByType("excbrick")
        for(var excbrick in excbricks) {
            excbricks[excbrick].reset()
        }

        // reset block
        var blocks = entityManager.getEntityArrayByType("block")
        for(var block in blocks) {
            blocks[block].reset()
        }

        var flowers = entityManager.getEntityArrayByType("flower")
        for(var flower in flowers) {
            flowers[flower].reset()
        }

        var bricks = entityManager.getEntityArrayByType("brick")
        for(var brick in bricks) {
            bricks[brick].reset()
        }

        var snowballs = entityManager.getEntityArrayByType("snowball")
        for(var snowball in snowballs) {
            snowballs[snowball].reset()
        }




        // reset time and timer
        time = 0
        levelTimer.restart()
    }

}
