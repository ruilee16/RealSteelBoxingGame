import QtQuick 2.0
import VPlay 2.0
import "../common" as Common
import QtMultimedia 5.5

Common.LevelBase {
    id: duo_mode
    levelName: "Duo Mode"

    Common.Enemy {
        id: atom
        source: "../img/atom_burned.png"
        width: 100
        height: 200
        anchors.horizontalCenterOffset:  -120
    }

    SoundEffect {
        id: punchMusic
        source: "../img/punch2.wav"
    }


    function handleLeft() {
        leftPunchPressed()
        punchMusic.play()
        punching_left.start()
    }

    function handleLeft_2() {
        leftPunchPressed()
        punchMusic.play()
        punching_right.start()
    }

    SequentialAnimation {
        id: punching_left
        ParallelAnimation {
            NumberAnimation {
                target: left_punch_zeus
                property: "anchors.horizontalCenterOffset"
                to: -120
                duration: 100
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: left_punch_zeus
                property: "anchors.verticalCenterOffset"
                to: 0
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
        ParallelAnimation {
            NumberAnimation {
                target: left_punch_zeus
                property: "anchors.horizontalCenterOffset"
                to: -190
                duration: 100
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: left_punch_zeus
                property: "anchors.verticalCenterOffset"
                to: 110
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }

    }

    SequentialAnimation {
        id: punching_right
        ParallelAnimation {
            NumberAnimation {
                target: right_punch_zeus
                property: "anchors.horizontalCenterOffset"
                to: -120
                duration: 100
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: right_punch_zeus
                property: "anchors.verticalCenterOffset"
                to: 0
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }
        ParallelAnimation {
            NumberAnimation {
                target: right_punch_zeus
                property: "anchors.horizontalCenterOffset"
                to: -90
                duration: 100
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: right_punch_zeus
                property: "anchors.verticalCenterOffset"
                to: 110
                duration: 100
                easing.type: Easing.InOutQuad
            }
        }

    }

    Common.Punch {
        id: left_punch_zeus
        anchors.horizontalCenterOffset:  -190
        mirror: true
        transform: Rotation { origin.x: 48; origin.y: 48; angle: 45}

        MouseArea {
            anchors.fill: parent
            // since the level is loaded in the gameScene, and is therefore a child of the gameScene, you could also access gameScene.score here and modify it. But we want to keep the logic in the gameScene rather than spreading it all over the place
            onPressed: handleLeft()
        }

    }

    Common.Punch {
        id: right_punch_zeus
        anchors.horizontalCenterOffset:  -90
        transform: Rotation { origin.x: 48; origin.y: 48; angle: -45}

        MouseArea {
            anchors.fill: parent
            // since the level is loaded in the gameScene, and is therefore a child of the gameScene, you could also access gameScene.score here and modify it. But we want to keep the logic in the gameScene rather than spreading it all over the place
            onPressed: handleLeft_2()
        }
    }

    Common.Enemy {
        id: zeus
        source: "../img/zeus_1500_burned.png"
        width: 200
        height: 200
        anchors.horizontalCenterOffset:  150
    }

    Common.Punch {
        id: left_punch_atom
        anchors.horizontalCenterOffset:  90
        mirror: true
        transform: Rotation { origin.x: 48; origin.y: 48; angle: 45}
        MouseArea {
            anchors.fill: parent
            // since the level is loaded in the gameScene, and is therefore a child of the gameScene, you could also access gameScene.score here and modify it. But we want to keep the logic in the gameScene rather than spreading it all over the place
            onPressed: rightPunchPressed()
        }
    }

    Common.Punch {
        id: right_punch_atom
        anchors.horizontalCenterOffset:  190
        transform: Rotation { origin.x: 48; origin.y: 48; angle: -45}
        MouseArea {
            anchors.fill: parent
            // since the level is loaded in the gameScene, and is therefore a child of the gameScene, you could also access gameScene.score here and modify it. But we want to keep the logic in the gameScene rather than spreading it all over the place
            onPressed: rightPunchPressed()
        }
    }

    SequentialAnimation {
        running: true
        // let it run forever
        loops: Animation.Infinite
        // move the rectangle left by changing the offset from current (120) to -120
        NumberAnimation {
            target: atom
            property: "anchors.horizontalCenterOffset"
            duration: 1000
            easing.type: Easing.InOutQuad
            to: -160
        }
        // after moving left has finished, we move the rectangle right by changing the offset from current (-120) to 120
        NumberAnimation {
            target: atom
            duration: 1000
            property: "anchors.horizontalCenterOffset"
            easing.type: Easing.InOutQuad
            to: -120
        }
    }

    SequentialAnimation {
        running: true
        // let it run forever
        loops: Animation.Infinite
        // move the rectangle left by changing the offset from current (120) to -120
        NumberAnimation {
            target: zeus
            property: "anchors.horizontalCenterOffset"
            duration: 1000
            easing.type: Easing.InOutQuad
            to: 120
        }
        // after moving left has finished, we move the rectangle right by changing the offset from current (-120) to 120
        NumberAnimation {
            target: zeus
            duration: 1000
            property: "anchors.horizontalCenterOffset"
            easing.type: Easing.InOutQuad
            to: 150
        }
    }


}