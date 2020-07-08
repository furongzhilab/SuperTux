import QtQuick 2.0
import Felgo 3.0

PlatformerEntityBaseDraggable {
    id: block
    entityType: "block"

    // this property is true when the player collected the coin
    property bool hited: false

    // when the coin is collected, it shouldn't be visible anymore
    image.visible:true

    // define colliderComponent for collision detection while dragging
    colliderComponent: collider
    property int time: 1
    property int isShine: -1

    Timer{
        id:change_QuestionBlock
        running: true
        repeat: true

        onTriggered: {
            time--
            if(hited == false && isShine == -1 && time == 0){
                image.source="../../assets/brick/question_block_shine.png"
                isShine *= -1
                time = 1
            }
            else if(hited == false && time == 0 && isShine == 1){
                image.source="../../assets/brick/question_block.png"
                time = 1
                isShine *= -1
            }
        }

    }

    BoxCollider {
        id:body
        anchors.fill: image
        bodyType: Body.Static

        // Category6: powerup
        categories: Box.Category6
    }

    // set collected to true
    function hit() {
        console.debug("hit block.")
        hited = true
        image.source="../../assets/brick/empty.png"

        if(snowball.hadhited == false && block === first_block){
            snowball.visible = true
            hited = false
        }

        if(coin1.hadhited == false && block === block1){
            coin1.isBrickCoin = true
            penguin.score+=1

            coin1.collected = true
            coin1.collect()
        }

        if(coin2.hadhited == false && block === block2){
            coin2.isBrickCoin = true
            penguin.score+=1

            coin2.collected = true
            coin2.collect()
        }

        if(coin3.hadhited == false && block === block3){
            coin3.isBrickCoin = true
            penguin.score+=1

            coin3.collected = true
            coin3.collect()
        }

        if(coin4.hadhited == false && block === block4){
            coin4.isBrickCoin = true
            penguin.score+=1

            coin4.collected = true
            coin4.collect()
        }

        if(coin5.hadhited === false && block === block5){
            coin5.isBrickCoin = true
            penguin.score+=1

            coin5.collected = true
            coin5.collect()
        }

        if(coin6.hadhited === false && block === block6){
            coin6.isBrickCoin = true
            penguin.score+=1

            coin6.collected = true
            coin6.collect()
        }

        if(coin7.hadhited === false && block === block7){
            coin7.isBrickCoin = true
            penguin.score+=1

            coin7.collected = true
            coin7.collect()
        }

        if(coin8.hadhited === false && block === block8){
            coin8.isBrickCoin = true
            penguin.score+=1

            coin8.collected = true
            coin8.collect()
        }

        if(coin9.hadhited === false && block === block9){
            coin9.isBrickCoin = true
            penguin.score+=1

            coin9.collected = true
            coin9.collect()
        }

        if(coin10.hadhited === false && block === block10){
            coin10.isBrickCoin = true
            penguin.score+=1

            coin10.collected = true
            coin10.collect()
        }

        if(coin11.hadhited === false && block === block11){
            coin11.isBrickCoin = true
            penguin.score+=1

            coin11.collected = true
            coin11.collect()
        }

        if(coin12.hadhited === false && block === block12){
            coin12.isBrickCoin = true
            penguin.score+=1

            coin12.collected = true
            coin12.collect()
        }

        if(flower.hadhited == false && block === third_block){
            flower.isBrickFlower = true
            console.debug("flower visible")
        }

        audioManager.playSound("hitBrick")
    }

    function reset() {
        hited= false
        image.visible=true
        time=1
        isShine= -1
    }
}
