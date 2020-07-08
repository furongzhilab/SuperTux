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

    GroundIce {
        row: -2
        column: 0
        size: 5
    }

    GroundIce {
        row: -2
        column: 1
        size: 5
    }

    Ground{
        row: -2
        column: 2
        size: 5
    }

    Ground{
        row:5
        column: 3
        size:2
    }

    Ground{
        row:9
        column: 5
        size:2
    }

    Ground{
        row:13
        column: 2
        size:2
    }

    Ground{
        row:16
        column: 4
        size:2
    }

    Ground{
        row:19
        column: 7
        size:4
    }

    Ground{
        row:25
        column: 5
        size:2
    }

    Ground{
        row:28
        column: 2
        size:10
    }

    GroundIce{
        row:28
        column: 0
        size:42
    }

    GroundIce{
        row:28
        column: 1
        size:10
    }

    Ground{
        row:38
        column: 1
        size:7
    }

    GroundIce{
        row:45
        column: 1
        size:25
    }
    Ground{
        row:45
        column: 2
        size:7
    }

    GroundIce{
        row:52
        column: 2
        size:2
    }
    Ground{
        row:52
        column: 3
        size:2
    }

    GroundIce{
        row:54
        column: 3
        size:4
    }

    GroundIce{
        row:54
        column: 2
        size:4
    }

    Ground{
        row:54
        column: 4
        size:4
    }

    Ground{
        row:58
        column: 2
        size:12
    }

    GroundIce{
        row:70
        column: 0
        size:20
    }

    GroundIce{
        row:70
        column: 1
        size:5
    }

    GroundIce{
        row:80
        column: 1
        size:5
    }

    Ground{
        row:70
        column: 2
        size:5
    }

    Spikes{
        row:75
        column: 0.5
        size:10
    }

    Ground{
        row:80
        column: 2
        size:5
    }

    GroundIce{
        row:90
        column: 1
        size:15
    }

    GroundIce{
        row:90
        column: 0
        size:15
    }

    Ground{
        row:90
        column: 2
        size:15
    }


    CoinGround{
        row: 3
        column: 3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:3.5
        column: 3.6
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:4
        column: 4.2
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:4.5
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:7
        column: 5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:7.5
        column: 5.6
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:8
        column: 6.2
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:8.5
        column: 6.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:13.5
        column: 3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:14
        column: 3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:16.5
        column: 5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:17
        column: 5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:20
        column: 8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:20.5
        column: 8
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:21
        column: 8
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:21.5
        column: 8
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row: 25.5
        column: 6
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:26
        column: 6
        startX: row*64
        startY: level.height-(column+1)*64
    }

    MonsterRebot{
        row:30
        column: 8
    }

    MonsterSnow{
        row:32
        column: 4
    }

    MonsterRed{
        row:40
        column: 8
    }

    Brick{
        row:76.5
        column: 4
    }
    Brick{
        row:77
        column: 4
    }

    Brick{
        row:77.5
        column: 4
    }
    Brick{
        row:78
        column: 4
    }

    MonsterSnow{
        row:60
        column: 4
    }

    MonsterRed{
        row:65
        column: 8
    }

    Spikes{
        row:85
        column: 0.5
        size: 10
    }

    Brick{
        row:86.5
        column: 4
    }

    Brick{
        row:87
        column: 4
    }
    Brick{
        row:87.5
        column: 4
    }

    Brick{
        row:88
        column: 4
    }

    Block{
        row:55
        column: 6
    }

    CoinGround {
        row: 55.1
        column: 6.4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick{
        row:55.5
        column: 6
    }

    CoinGround {
        row: 55.6
        column: 6.4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick{
        row:56
        column: 6
    }

    CoinGround {
        row: 56.6
        column: 6.4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Block{
        row:56.5
        column: 6
    }
    CoinGround {
        row: 56.1
        column: 6.4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:45.5
        column: 4
        startX: row*64
        startY: level.height-(column+1)*64
    }


    CoinGround{
        row:46
        column: 3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:47.5
        column: 3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:48
        column: 3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:49.5
        column: 3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:50
        column: 4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Block{
        row:65
        column: 4
    }

    Brick{
        row:65.5
        column: 4
    }
    Brick{
        row:66
        column: 4
    }
    Block{
        row:66.5
        column: 4
    }
    Brick{
        row:67
        column: 4
    }
    Brick{
        row:67.5
        column: 4
    }
    Block{
        row:68
        column: 4
    }

    MonsterIce {
        row: 63
        column: 2
        dieIce.visible: false
    }

    MonsterSnow {
        row: 58
        column: 2
    }

    CoinGround{
        row:65
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:65.5
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:66
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:66.5
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:67
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:67.5
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:68
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:77
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:77.5
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    MonsterRed{
        row:80
        column: 4
    }

    CoinGround{
        row:87
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:87.5
        column: 4.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Goal {
        row: 96
        column: 5.7
    }
}


