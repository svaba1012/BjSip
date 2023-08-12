import QtQuick
import QtQuick.Controls


import "../Components/Reusables"

Rectangle {

    Column{
        topPadding: 10
        width: parent.width
        CustomText{
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 20
            text: qsTr("Settings") + bjSip.emptyString
            bottomPadding: 30
        }
        Rectangle{
            color: theme.textColor
            height: 2
            width: parent.width
        }
        Column{
            topPadding: 5
            leftPadding: 10
            width: parent.width
            spacing: 2
            CustomText{
                text: qsTr("Color mode ") + bjSip.emptyString
            }
            Row{
                width: parent.width
                spacing: 2

                Icon{
                    anchors.verticalCenter: parent.verticalCenter
                    symbol: "\uf185"
                }
                Switch{
                    anchors.verticalCenter: parent.verticalCenter
                    onToggled: () => {
                        theme.isLightMode = position < 0.5
                    }
                }
                Icon{
                    anchors.verticalCenter: parent.verticalCenter
                    symbol: "\uf186"
                }
            }
        }
        Rectangle{
            color: theme.textColor
            height: 2
            width: parent.width
        }
        Column{
            topPadding: 5
            leftPadding: 10
            width: parent.width
            spacing: 2
            CustomComboBox{
                label: qsTr("Language") + bjSip.emptyString
                list: [
                    qsTr("Serbian (Cyrillic)") + bjSip.emptyString,
                    qsTr("Serbian (Latin)") + bjSip.emptyString,
                    qsTr("English") + bjSip.emptyString
                ]
                onElementSelected: (curIndex) => {
                    if(curIndex === 0){
                        bjSip.changeLanguage("src");
                    }else if(curIndex === 1){
                        bjSip.changeLanguage("sr");
                    }else if(curIndex === 2){
                        bjSip.changeLanguage("en");
                    }
                }
                bottomPadding: 5
            }


        }
        Rectangle{
            color: theme.textColor
            height: 2
            width: parent.width

        }
    }
}
