import QtQuick
import "."

Circle {
    property int size: 50
    property alias symbol: icon.symbol
    property real iconSize: 0.5
    property var onClick
    property string textColor: theme.textColor
    color: "transparent"
    Icon{
        id: icon
        color: textColor
        anchors.centerIn: parent
        font.pixelSize: size * iconSize
    }
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: onClick()
    }
    r: size
}
