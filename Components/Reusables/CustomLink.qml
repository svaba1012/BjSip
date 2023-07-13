import QtQuick
import QtQuick.Controls

Item {
    required property var viewName
    property var stackView: appView
    height: 20
    width: 100
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: () => stackView.replace(viewName)
    }

}
