import QtQuick

import "/scripts/Utils/changeBrightness.js" as ColorJs

Rectangle {
    property var onClick
    property alias text: textBox.text
    property string textColor: theme.textColor
    property string col
    height: 30
    radius: height / 4
    scale: mouseArea.containsMouse ? 1.02 : 1
    color: mouseArea.containsMouse ? ColorJs.changeBrightness(col, -0.05) : col
    Text{
        //warning here
        font.pointSize: Math.ceil(height * 0.7)
        id: textBox
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
