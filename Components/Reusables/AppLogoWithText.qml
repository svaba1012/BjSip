import QtQuick
import QtQuick.Layouts

Rectangle{
    id: logoWithText
    color: "transparent"
    ColumnLayout{
        id: logo
        width: parent.width
        anchors.centerIn: parent

        AppLogo{
            Layout.topMargin: -80
            Layout.preferredHeight:  0.5 * logoWithText.width
            Layout.preferredWidth: 0.5 * logoWithText.width
            anchors.horizontalCenter: parent.horizontalCenter
        }
        CustomText{
            Layout.topMargin: -0.09 * logoWithText.width
            text: qsTr("BjSip")
            font.pointSize: 0.1 * logoWithText.width
            anchors.horizontalCenter: parent.horizontalCenter
        }
        CustomText{
            Layout.topMargin: -0.03 * logoWithText.width
            text: qsTr("Keep talking") //Nek razgovori ne prestaju
            font.pointSize: 0.05 * logoWithText.width
            font.italic: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
