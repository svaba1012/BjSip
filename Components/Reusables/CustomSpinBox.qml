import QtQuick
import QtQuick.Controls

import "/scripts/Utils/changeBrightness.js" as ColorJs


Rectangle{
    property string label: ""
    property alias value: control.value
    property string icon: ""
    property string backgroundColor: theme.backgroundColor
    property string textColor: theme.textColor
    property string borderColor: ColorJs.changeBrightness(backgroundColor, -0.05)
    property int borderWidth: 1
    color: ColorJs.changeBrightness(backgroundColor, 0.05)
    border.color: control.activeFocus ? theme.primaryColor : borderColor
    border.width: borderWidth
    width: control.width + 5
    height: control.height * 2
    radius: 5
    Rectangle{
        visible: control.activeFocus
        width: parent.width + 2 * borderWidth + 4
        height: parent.height + 2 * borderWidth + 4
        anchors.centerIn: parent
        radius: 8
        opacity: 0.5
        color: "transparent"
        border.color: ColorJs.changeBrightness(theme.primaryColor, 0.1)
        border.width: 4
    }
    Row{
        height: parent.height
        width: parent.width
        Rectangle{
            visible: icon.length > 0
            height: parent.height
            width: 40
            color: "transparent"
            Icon{
                anchors.centerIn: parent
                symbol: icon
            }
        }
        Rectangle{
            visible: icon.length > 0
            height: parent.height
            width: borderWidth
            color: borderColor
        }
        Rectangle{
            height: parent.height
            width: parent.width - (icon.length > 0 ? 40 + borderWidth : 0)
            color: "transparent"
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.IBeamCursor
                onClicked: () => {
                    control.forceActiveFocus()
                }
            }
            Rectangle{
                id: labelBox
                color: "transparent"
                height: parent.height
                width: parent.width - 4
                anchors.top: parent.top
                x: 4
                Rectangle{
                    height: 0.5 * parent.height
                    width: parent.width
                    color: "transparent"
                    anchors.verticalCenter: parent.verticalCenter

                    CustomText{
                        id: labelText
                        visible: label.length > 0
                        text: label
                        font.pointSize: height * 0.7
                        anchors.fill: parent
                    }
                }

                ParallelAnimation{
                    id: shrinkLabelAnim
                    PropertyAnimation{
                        target: labelBox
                        property: "height"
                        duration: 100
                        from: control.height * 2
                        to: control.height
                    }
                }

                ParallelAnimation{
                    id: spreadLabelAnim
                    PropertyAnimation{
                        target: labelBox
                        property: "height"
                        duration: 100
                        to: control.height * 2
                        from: control.height
                    }
                }

            }

            SpinBox {
                id: control
                value: 0
                editable: true
                width: parent.width
                anchors.bottom: parent.bottom
                visible: activeFocus || value > 0
                onActiveFocusChanged: {
                    if (activeFocus) {
                        if(value === 0){
                            shrinkLabelAnim.start()
                            labelText.color = ColorJs.changeBrightness(borderColor, theme.isLightMode ? -0.2 : 0.3)
                        }
                    } else {
                        if(value === 0){
                            spreadLabelAnim.start()
                            labelText.color = theme.textColor
                        }
                    }
                }
                up.indicator: Rectangle {
                    x: parent.width - width
                    height: parent.height / 2
                    implicitWidth: 20
                    color: "transparent"
//                    color: control.up.pressed ? theme.textColor : "red"
//                    border.color: enabled ? "#21be2b" : "#bdbebf"
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: value += 1
                    }
                    Icon{
                        symbol: "\uf0d8"
                        font.pixelSize: control.font.pixelSize * 1.2
                        color: control.up.pressed ? ColorJs.changeBrightness(theme.textColor, -0.05)  : theme.textColor
                        anchors.fill: parent
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                down.indicator: Rectangle {
                    x: parent.width - width
                    y: parent.height / 2
                    height: parent.height / 2
                    implicitWidth: 20
                    color: "transparent"
//                    color: control.up.pressed ? theme.textColor : "red"
//                    border.color: enabled ? "#21be2b" : "#bdbebf"
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: value -= 1
                    }
                    Icon{
                        symbol: "\uf0d7"
                        font.pixelSize: control.font.pixelSize * 1.2
                        color: control.up.pressed ? ColorJs.changeBrightness(theme.textColor, -0.05)  : theme.textColor
                        anchors.fill: parent
                        fontSizeMode: Text.Fit
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                }
                background: Rectangle{
                    color: "transparent"
                    radius: 5
                }

                contentItem: TextInput {
                    z: 2
                    text: control.textFromValue(control.value, control.locale)

                    font.family: globalFont
                    color: textColor
                    horizontalAlignment: Qt.AlignLeft
                    verticalAlignment: Qt.AlignVCenter

                    readOnly: !control.editable
                    validator: control.validator
                    inputMethodHints: Qt.ImhFormattedNumbersOnly
                }
            }

//            TextField {
//                id: textField
//                width: parent.width
//                color: textColor
//                anchors.bottom: parent.bottom
////                bottomPadding: height * 0.3
//                onActiveFocusChanged: {
//                    if (activeFocus) {
//                        if(text.length === 0){
//                            shrinkLabelAnim.start()
//                            labelText.color = ColorJs.changeBrightness(borderColor, -0.2)
//                        }
//                    } else {
//                        if(text.length === 0){
//                            spreadLabelAnim.start()
//                            labelText.color = theme.textColor
//                        }
//                    }
//                }
//                background: Rectangle {
//                    color: "transparent"
//                    radius: 5
//                }
//            }
        }
    }


}





/*Column{
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
        background: Rectangle{
            color: theme.backgroundColor
        }
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
}*/
