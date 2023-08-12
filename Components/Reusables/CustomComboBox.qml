import QtQuick
import QtQuick.Controls


Column{
    property string label: ""
    property var list
    property var onElementSelected
    spacing: 2
    Text {
        visible: label.length > 0
        text: label
        font.family: globalFont
        color: theme.textColor
    }
    ComboBox{
        model: list
        onActivated: () => onElementSelected(currentIndex)
    }
}
