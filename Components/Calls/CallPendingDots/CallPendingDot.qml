import QtQuick

Rectangle {
    id: dot
    property int size: 20
    property int time: 1000
    property int delay: 0
    radius: size
    width: size
    height: size
    color: "grey"

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
        loops: Animation.Infinite
        running: false
        ScaleAnimator{
            target: dot
            from: 0.2
            to: 1
            duration: time
        }
        ScaleAnimator{
            target: dot
            to:  0.2
            from: 1
            duration: time
        }
    }
}
