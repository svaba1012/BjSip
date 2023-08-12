import QtQuick
import QtQuick.Controls


Rectangle {
    required property int i
    required property var tabView
    property var targetView
    property var stackView
    property alias text: label.text
    property string iconSymbol: ""
    property int minWidth: label.width + 20
    property int potencialWidth: 0

    width: potencialWidth > minWidth ? potencialWidth : minWidth
    color: theme.primaryColor
    Column{
        width: label.width
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
    Rectangle{
        anchors.bottom: parent.bottom
        height: 4
        width: parent.width
        color: index === currentIndex ? theme.successColor : theme.textColor
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
