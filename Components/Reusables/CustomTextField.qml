import QtQuick
import QtQuick.Controls

Column{
    property string label: ""
    property alias echoMode: textField.echoMode
    property alias value: textField.text
    spacing: 2
    Text {
        visible: label.length > 0
        text: qsTr(label)
        font.family: globalFont
        color: theme.textColor
    }
    TextField {
        id: textField
        width: parent.width
    }
}
