import QtQuick
import QtQuick.Controls


import "/scripts/Utils/changeBrightness.js" as ColorJs


Rectangle{
    property string label: ""
    property alias echoMode: textField.echoMode
    property alias value: textField.text
    property string icon: ""
    property string backgroundColor: theme.backgroundColor
    property string textColor: theme.textColor
    property string borderColor: ColorJs.changeBrightness(backgroundColor, -0.05)
    property int borderWidth: 1
    color: ColorJs.changeBrightness(backgroundColor, 0.05)
    border.color: textField.activeFocus ? theme.primaryColor : borderColor
    border.width: borderWidth
    width: textField.width + 5
    height: textField.height * 2
    radius: 5
    Rectangle{
        visible: textField.activeFocus
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
                    textField.forceActiveFocus()
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
                        from: textField.height * 2
                        to: textField.height
                    }
                }

                ParallelAnimation{
                    id: spreadLabelAnim
                    PropertyAnimation{
                        target: labelBox
                        property: "height"
                        duration: 100
                        to: textField.height * 2
                        from: textField.height
                    }
                }

            }

            TextField {
                id: textField
                width: parent.width
                color: textColor
                anchors.bottom: parent.bottom
//                bottomPadding: height * 0.3
                onActiveFocusChanged: {
                    if (activeFocus) {
                        if(text.length === 0){
                            shrinkLabelAnim.start()
                            labelText.color = ColorJs.changeBrightness(borderColor, theme.isLightMode ? -0.2 : 0.3)
                        }
                    } else {
                        if(text.length === 0){
                            spreadLabelAnim.start()
                            labelText.color = theme.textColor
                        }
                    }
                }
                background: Rectangle {
                    color: "transparent"
                    radius: 5
                }
            }
        }
    }


}
