import Felgo 3.0
import QtQuick 2.12
import "../entities"
import "." as Levels

Levels.LevelBase {
    id: level1
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
        size: 20
    }

    GroundIce {
        row: -2
        column: 1
        size: 15
    }

    Ground {
        row: 13
        column: 1
        size: 5
    }

    GroundIce{
        row:22
        column:0
        size:28
    }
    GroundIce{
        row:22
        column:1
        size:20
    }
    Ground{
        row:22
        column:2
        size:2
    }
    GroundIce{
        row:24
        column:2
        size:2
    }
    Ground{
        row:24
        column:3
        size:2
    }

    GroundIce{
        row:26
        column:3
        size:7
    }
    GroundIce{
        row:26
        column:2
        size:7
    }
    Ground{
        row:26
        column:4
        size:2
    }

    GroundIce{
        row:28
        column:4
        size:5
    }
    Ground{
        row:28
        column:5
        size:5
    }

    Ground{
        row:33
        column:2
        size:9
    }

    Spikes{
        row:42
        column:0.5
        size:6
    }

    GroundIce{
        row:45
        column: 1
        size:5
    }

    Ground{
        row:45
        column:2
        size:5
    }

    GroundIce{
        row:50
        column: 0
        size:20
    }

    GroundIce{
        row:50
        column: 1
        size:2
    }

    Ground{
        row:50
        column: 2
        size:2
    }

    Spikes{
        row:52
        column: 0.5
        size:4
    }

    GroundIce{
        row:54
        column: 1
        size:2
    }
    Ground{
        row:54
        column: 2
        size:2
    }

    Spikes{
        row:56
        column: 0.5
        size:4
    }

    GroundIce{
        row:58
        column: 1
        size:2
    }

    Ground{
        row:58
        column: 2
        size:2
    }

    Spikes{
        row:60
        column: 0.5
        size:4
    }

    GroundIce{
        row:62
        column: 1
        size:2
    }

    Ground{
        row:62
        column: 2
        size:2
    }

    Spikes{
        row:64
        column: 0.5
        size:4
    }

    GroundIce{
        row:66
        column: 1
        size:4
    }

    Ground{
        row:66
        column: 2
        size:4
    }


    Ground{
        row:70
        column:0
        size:20
    }
    Sign{
        row:2
        column: 4.2
        size:1
    }

    Brick{
        row:8
        column: 4
        size:2
    }

    Brick{
        row:9
        column: 4
        size:2
    }

    Block{
        id: first_block
        row:8.5
        column: 4
        size:2
    }

    SnowBall {
        id: snowball
        row: 8.5
        column: 5.4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    ExcBrick{
        row:7.5
        column: 4
        size:2
    }

    CoinGround{
        row:14
        column: 2
        startX: row*64
        startY: level.height-(column+1)*64
    }


    CoinGround{
        row:15
        column: 2
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:16
        column: 2
        startX: row*64
        startY: level.height-(column+1)*64
    }


    CoinGround{
        row:17
        column: 2
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:15
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:16
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:15.5
        column:4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    MonsterRed{
        row:25
        column:3
    }

    MonsterRed{
        row:40
        column:3
    }

    MonsterSnow{
        row:35
        column:3

    }

    CoinGround{
        row:47
        column:2.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:47.5
        column:2.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:48
        column:2.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:48.5
        column:2.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:49
        column:2.5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:49.5
        column:2.5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:27.5
        column:5
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:26.5
        column:5
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:22.5
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:23.5
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:29.5
        column:6
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:30.5
        column:6
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:31.5
        column:6
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:24.5
        column:4
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:25.5
        column:4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    CoinGround{
        row:68
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:67
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:63
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:59
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }
    CoinGround{
        row:55
        column:3
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Block{
        id: block1
        row:37.5
        column:4
    }

    Coin {
        id: coin1
        row: 37.6
        column: 4.4
        startX: row*64
        startY: level.height-(column+1)*64
    }

    Brick{
        row:36.5
        column:4
    }
    Brick{
        row:37
        column:4
    }
    Brick{
        row:38
        column:4
    }
    Brick{
        row:38.5
        column:4
    }

    Goal {
        row: 80
        column: 3.7
    }
}
