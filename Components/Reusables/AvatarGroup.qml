import QtQuick


Rectangle {
    property real intersect: 0.5
    property int avatarSize: 100
    property var sources: []
    property var alts: []
    property int maxNum: 3
    property int num: alts.length < maxNum ? alts.length : maxNum

    width: avatarSize * ((1 - intersect) * (num - 1) + 1)
    height:  avatarSize

    Repeater{
        model: num
        Avatar{
            required property int index
            x: avatarSize * (1 - intersect) * index
            y: parent.height / 2 - avatarSize / 2
            size: avatarSize
            alt: alts[index]
            border.width: 2
            border.color: "white"
        }
    }

    Circle{
        r: avatarSize * 0.5
        x: avatarSize * ((1 - intersect) * (maxNum - 1) + 1) - 0.5 * r
        y: parent.height / 2 - avatarSize / 2
        color: theme.accentColor
        border.width: 2
        border.color: "white"
        visible: alts.length > maxNum
        CustomText {
            anchors.centerIn:  parent
            text: "+" + (alts.length - maxNum)
            color: theme.backgroundColor
        }
    }
}
