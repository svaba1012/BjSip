import QtQuick

import "../../Reusables"

Circle{
    property int time: 1000
    property int delay: 0
    id: circle1
    r: parent.size + 20
    anchors.centerIn: parent
    color: "transparent"
    border.width: 1
    border.color: parent.color

    Timer {
        interval: delay
        running: true
        repeat: false
        onTriggered: {
            anim.running = true
        }
    }

    SequentialAnimation{
        id: anim
        running: false
        loops: Animation.Infinite
        ParallelAnimation{
            ScaleAnimator{
                target: circle1
                from: 0.5
                to: 1
                duration: time/2
            }
            OpacityAnimator{
                target: circle1
                from: 0
                to: 1
                duration: time/2
            }
        }
        ParallelAnimation{
            ScaleAnimator{
                target: circle1
                from: 1
                to: 1.3
                duration: time/2
            }
            OpacityAnimator{
                target: circle1
                from: 1
                to: 0
                duration: time/2
            }
        }
    }
}
