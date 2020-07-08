import Felgo 3.0
import QtQuick 2.12
import "../entities"
import "." as Levels

Levels.LevelBase {
    id: level
    // we need to specify the width to get correct debug draw for our physics
    // the PhysicsWorld component fills it's parent by default, which is the viewPort Item of the gameScene and this item uses the size of the level
    // NOTE: thy physics will also work without defining the width here, so no worries, you can ignore it untill you want to do some physics debugging
    width: 42 * gameScene.gridSize

    // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size
    Ground {
        row: -2
        column: 2
        size: 15
    }

    GroundIce {
        row: -2
        column: 0
        size: 60
    }

    GroundIce {
        row: -2
        column: 1
        size: 60
    }

    GroundIce {
        row: 13
        column: 2
        size: 5
    }

    Ground {
        row: 13
        column: 3
        size: 5
    }

    Ground {
        row: 18
        column: 2
        size: 16
    }

    GroundIce {
        row: 34
        column: 2
        size: 24
    }

    Ground {
        row: 34
        column: 3
        size: 2
    }

    GroundIce {
        row: 36
        column: 3
        size: 8
    }

    Ground {
        row: 36
        column: 4
        size: 2
    }

    GroundIce {
        row: 38
        column: 4
        size: 6
    }

    Ground {
        row: 38
        column: 5
        size: 2
    }

    GroundIce {
        row: 40
        column: 5
        size: 4
    }

    Ground {
        row: 40
        column: 6
        size: 4
    }


    Spikes {
        row: 44
        column: 2.5
        size: 6
    }

    GroundIce {
        row: 47
        column: 3
        size: 5
    }

    Ground {
        row: 47
        column: 4
        size: 5
    }

    Spikes {
        row: 52
        column: 2.5
        size: 6
    }

    GroundIce {
        row: 55
        column: 3
        size: 3
    }

    Ground {
        row: 55
        column: 4
        size: 3
    }

    GroundIce {
        row: 61
        column: 0
        size: 3
    }

    GroundIce {
        row: 61
        column: 1
        size: 3
    }

    GroundIce {
        row: 61
        column: 2
        size: 3
    }

    GroundIce {
        row: 61
        column: 3
        size: 3
    }

    Ground {
        row: 61
        column: 4
        size: 3
    }

    GroundIce {
        row: 67
        column: 0
        size: 3
    }

    GroundIce {
        row: 67
        column: 1
        size: 3
    }

    GroundIce {
        row: 67
        column: 2
        size: 3
    }

    GroundIce {
        row: 67
        column: 3
        size: 3
    }

    Ground {
        row: 67
        column: 4
        size: 3
    }

    GroundIce {
        row: 73
        column: 0
        size: 65
    }

    GroundIce {
        row: 73
        column: 1
        size: 65
    }

    GroundIce {
        row: 73
        column: 2
        size: 49
    }

    GroundIce {
        row: 73
        column: 3
        size: 35
    }

    GroundIce {
        row: 73
        column: 4
        size: 7
    }

    Ground {
        row: 73
        column: 5
        size: 1
    }

    GroundIce {
        row: 74
        column: 5
        size: 3
    }

    Ground {
        row: 74
        column: 6
        size: 1
    }

    GroundIce {
        row: 75
        column: 6
        size: 2
    }

    Ground {
        row: 75
        column: 7
        size: 2
    }

    Ground {
        row: 77
        column: 5
        size: 3
    }

    Ground {
        row: 80
        column: 4
        size: 18
    }

    Spikes {
        row: 98
        column: 3.5
        size: 4
    }

    GroundIce {
        row: 100
        column: 4
        size: 2
    }

    Ground {
        row: 100
        column: 4.5
        size: 2
    }

    GroundIce {
        row: 102
        column: 3.5
        size: 6
    }

    Spikes {
        row: 102
        column: 4
        size: 4
    }

    GroundIce {
        row: 104
        column: 4
        size: 4
    }

    Ground {
        row: 104
        column: 5
        size: 4
    }

    Ground {
        row: 108
        column: 3
        size: 10
    }

    GroundIce {
        row: 118
        column: 3
        size: 4
    }

    Ground {
        row: 118
        column: 3.5
        size: 1
    }

    GroundIce {
        row: 119
        column: 4
        size: 3
    }

    Ground {
        row: 119
        column: 4.5
        size: 1
    }

    GroundIce {
        row: 120
        column: 5
        size: 2
    }

    Ground {
        row: 120
        column: 5.5
        size: 2
    }

    Ground {
        row: 122
        column: 2
        size: 16
    }

    Grass {
        row: 3
        column: 2.4
        size: 1
    }

    //
    ExcBrick {
        row: 4.5
        column: 3.6
    }

    Brick {
        row: 5
        column: 3.6
    }

    Block {
        id: block1
        row: 5.5
        column: 3.6
    }

    Coin {
        id: coin1
        row: 5.6
        column: 4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick {
        row: 6
        column: 3.6
    }

    Block {
        id: block2
        row: 6.5
        column: 3.6
    }

    Coin {
        id: coin2
        row: 6.5
        column: 4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick {
        row: 7
        column: 3.6
    }

    Block {
        id: block3
        row: 7.5
        column: 3.6
    }

    Coin {
        id: coin3
        row: 7.6
        column: 4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    MonsterSnow {
        row: 8
        column: 2.4
    }

    MonsterRed {
        row: 12
        column: 2.4
    }

    //
    MonsterRebot {
        row: 15.5
        column: 5
    }

    //
    MonsterSnow {
        row: 18
        column: 2.4
    }

    MonsterRed {
        row: 20
        column: 2.4
    }

    MonsterIce {
        row: 22
        column: 2.4
        dieIce.visible: false
    }

    MonsterSnow {
        row: 32
        column: 2.4
    }

    MonsterSnow {
        row: 37
        column: 4
    }

    MonsterBomb {
        row: 43
        column: 7
        dieBomb.visible: false
    }

    Sign {
        row: 20.5
        column: 4.2
    }

    Block {
        id: block4
        row: 26
        column: 3.6
    }

    Coin {
        id: coin4
        row: 26.1
        column: 4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick {
        row: 26.5
        column: 3.6
    }

    ExcBrick {
        row: 27
        column: 3.6
    }

    Brick {
        row: 27.5
        column: 3.6
    }

    Block {
        id: block5
        row: 28
        column: 3.6
    }

    Coin {
        id: coin5
        row: 28.1
        column: 4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick {
        row: 28.5
        column: 3.6
    }

    Block {
        id: first_block
        row: 29
        column: 3.6
    }


    SnowBall{
        id: snowball
        row: 29
        column: 5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    //
    CoinGround {
        row: 34.5
        column: 3.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 35
        column: 3.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 36.5
        column: 4.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 37
        column: 4.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 38.5
        column: 5.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 39
        column: 5.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    //
    CoinGround {
        row: 41
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 41.5
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 42
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 42.5
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    //
    MonsterRebot {
        row: 49
        column: 6.8
    }

    MonsterSnow {
        row: 62
        column: 4
    }

    //
    CoinGround{
        row: 62
        column: 4.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 62.5
        column: 4.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 63
        column: 4.7
        startX: row*64
        startY: level.height-(column+1)*64
//        isBrickCoin: true
    }

    //
    MonsterBomb {
        row: 68
        column: 4
        dieBomb.visible: false
    }

    //
    Brick {
        row: 78
        column: 6.6
    }

    Brick {
        row: 78
        column: 7.1
    }

    Brick {
        row: 78
        column: 7.6
    }

    Brick {
        row: 78
        column: 8.1
    }

    Brick {
        row: 78
        column: 8.6
    }

    Brick {
        row: 78.5
        column: 6.6
    }

    Brick {
        row: 78.5
        column: 8.6
    }

    Brick {
        row: 79
        column: 6.6
    }

    Brick {
        row: 79
        column: 8.6
    }

    Brick {
        row: 79.5
        column: 6.6
    }

    Brick {
        row: 79.5
        column: 8.6
    }

    Brick {
        row: 80
        column: 6.6
    }

    Brick {
        row: 80
        column: 8.6
    }

    Brick {
        row: 80.5
        column: 6.6
    }

    Brick {
        row: 80.5
        column: 8.6
    }

    Brick {
        row: 81
        column: 6.6
    }

    Brick {
        row: 81
        column: 7.1
    }

    Brick {
        row: 81
        column: 7.6
    }

    Brick {
        row: 81
        column: 8.1
    }

    Brick {
        row: 81
        column: 8.6
    }

    CoinGround {
        row: 78.6
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 78.6
        column: 7.3
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 78.6
        column: 7.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

   CoinGround {
        row: 79.1
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 79.1
        column: 7.3
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 79.1
        column: 7.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 79.6
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 79.6
        column: 7.3
        startX: row*64
        startY: level.height-(column+1)*64
    }

   CoinGround {
        row: 79.6
        column: 7.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 80.1
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 80.1
        column: 7.3
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row: 80.1
        column: 7.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 80.6
        column: 6.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row: 80.6
        column: 7.3
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 80.6
        column: 7.8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Sign_Flower {
        row: 83
        column: 6.2
    }

    Block {
        id: block6
        row: 88.5
        column: 5.5
    }

    Coin {
        id: coin6
        row: 88.6
        column: 6
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Block {
        id: block7
        row: 89
        column: 5.5
    }

    Coin {
        id: coin7
        row: 89.1
        column: 6
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Block {
        row: 89
        column: 7.5
    }

    Block {
        id: third_block
        row: 89.5
        column: 5.5
    }

    Flower {
        id: flower
        row: 89.5
        column: 5.7
        startX: row*64
        startY: level.height-(column+1)*64
    }

    ExcBrick{
        row: 89.5
        column: 7.5
    }

    Block {
        id: block8
        row: 90
        column: 5.5
    }

    Coin {
        id: coin8
        row: 90.1
        column: 6
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Block {
        row: 90
        column: 7.5
    }

    Block {
        id: block9
        row: 90.5
        column: 5.5
    }

    Coin {
        id: coin9
        row: 90.6
        column: 6
        startX: row*64
        startY: level.height-(column+1)*64
    }

    MonsterIce {
        row: 83
        column: 4
        dieIce.visible: false
    }

    MonsterRed {
        row: 85
        column: 4
    }

    MonsterSnow {
        row: 87
        column: 4
    }

    MonsterIce {
        row: 89
        column: 4
        dieIce.visible: false
    }

    MonsterRed {
        row: 90
        column: 4
    }

    MonsterSnow {
        row: 93
        column: 4
    }

    //
    MonsterRed {
        row: 100
        column: 5
    }

    //
    CoinGround {
        row: 105
        column: 5.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row: 105.5
        column: 5.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 106
        column: 5.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 106.5
        column: 5.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    //
    MonsterSnow {
        row: 106
        column: 5
    }

    Block  {
        id: block10
        row: 112
        column: 4.5
    }

    Coin {
        id: coin10
        row: 112.1
        column: 5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick {
        row: 112.5
        column: 4.5
    }

    Block  {
        id: block11
        row: 113
        column: 4.5
    }

    Coin {
        id: coin11
        row: 113.1
        column: 5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick {
        row: 113.5
        column: 4.5
    }

    Block {
        id: block12
        row: 114
        column: 4.5
    }

    Coin {
        id: coin12
        row: 114.1
        column: 5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    MonsterRebot {
        row: 120
        column: 6
    }

    //
    CoinGround {
        row: 120.3
        column: 6.2
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 120.8
        column: 6.2
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround {
        row: 121.3
        column: 6.2
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Goal {
        row: 131
        column: 5.7
    }
}

