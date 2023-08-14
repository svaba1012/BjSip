import QtQuick
import "../Reusables"

Rectangle {
    required property var buddy;
    width: parent.width/parent.columns
    height: parent.height/parent.rows
    border.width: 2
    border.color: theme.secondaryColor
    color: theme.backgroundColor
    Column{
        anchors.centerIn: parent
        spacing: 10
        Avatar{
            size: 75
            alt: buddy.contact_name
            anchors.horizontalCenter: parent.horizontalCenter
        }
        CustomText {
            text: buddy.contact_name
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
