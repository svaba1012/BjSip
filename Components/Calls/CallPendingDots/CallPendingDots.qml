import QtQuick

Row {
    id: dots
    property int dotsNum: 11
    property int timeStep: 100
    property int dotSize
    spacing: 2
    Timer{
        interval: (dotsNum / 2 + 1) * timeStep
        running: true
        repeat: false
        onTriggered: {dots.visible=true}
    }
    visible: false
    Repeater{
        model: dotsNum
        CallPendingDot{
            id: dot
            required property int index
            delay: (index < dotsNum / 2) ? timeStep * (index + 1) : timeStep * (dotsNum - index)
            time: (dotsNum) * timeStep
            size: dotSize
        }
    }
}
