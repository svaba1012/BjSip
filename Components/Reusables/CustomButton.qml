import QtQuick

import "/scripts/Utils/changeBrightness.js" as ColorJs

Rectangle {
    property var onClick
    property alias text: textBox.text
    property string textColor: theme.textColor
    property string col
    radius: height / 4
    scale: mouseArea.containsMouse ? 1.02 : 1
    color: mouseArea.containsMouse ? ColorJs.changeBrightness(col, -0.05) : col

    width: textBox.width * 1.3
    height: textBox.height * 2

    Text{
        //warning here
        id: textBox
        font.pointSize: Math.ceil(height * 0.7)
        color: textColor
        font.family: globalFont
        anchors.centerIn: parent
    }
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: () =>{
            onClick()
        }
        hoverEnabled: true
    }
}
