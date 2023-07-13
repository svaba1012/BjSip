import QtQuick
import QtQuick.Controls

Rectangle {
    required property int i
    required property var tabView
    property var targetView
    property var stackView
    property alias text: label.text
    property string iconSymbol: ""

    color: theme.accentColor

    Column{
        width: parent.width
        anchors.centerIn: parent
        spacing: 3
        Icon{
            visible: iconSymbol.length > 0
            symbol: iconSymbol
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            color: tabView.currentIndex === i ? theme.successColor : theme.textColor
        }
        CustomText{
            id: label
            font.pointSize: 12
            anchors.horizontalCenter: parent.horizontalCenter
            color: tabView.currentIndex === i ? theme.successColor : theme.textColor
        }
    }
    MouseArea{
        anchors.fill: parent
        onClicked: () => {
            if(tabView.currentIndex !== i){
                stackView.replace(targetView)
                tabView.currentIndex = i;
            }
        }
        cursorShape: Qt.PointingHandCursor
    }
}
