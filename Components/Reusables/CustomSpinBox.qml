import QtQuick
import QtQuick.Controls

Column{
    property string label: ""
    property alias value: control.value
    spacing: 2
    Text {
        visible: label.length > 0
        text: label
        font.family: globalFont
        color: theme.textColor
    }
    SpinBox {
        id: control
        value: 0
        editable: true
        width: parent.width
        contentItem: TextInput {
            z: 2
            text: control.textFromValue(control.value, control.locale)

            font.family: globalFont
            color: theme.backgroundColor
    //        selectionColor: "#21be2b"
    //        selectedTextColor: "#ffffff"
            horizontalAlignment: Qt.AlignLeft
            verticalAlignment: Qt.AlignVCenter

            readOnly: !control.editable
            validator: control.validator
            inputMethodHints: Qt.ImhFormattedNumbersOnly
        }
    }
}
