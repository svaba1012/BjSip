import QtQuick
import "../Reusables"

Row {
    width: parent.width
    spacing: 3
    Avatar{}
    Column{
        spacing: 2
        anchors.verticalCenter: parent.verticalCenter
        Text {
            text: "username"
        }
        Text {
            text: "timeOfCall"
        }
    }
}
