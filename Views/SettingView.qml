import QtQuick
import QtQuick.Controls


import "../Components/Reusables"

Rectangle {

    Column{
        topPadding: 10
        width: parent.width
        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            bottomPadding: 30
            spacing: 8
            Icon{
                font.pointSize: 20
                anchors.verticalCenter: parent.verticalCenter
                symbol: "\uf013"
            }
            CustomText{
                anchors.verticalCenter: parent.verticalCenter
                font.pointSize: 20
                text: qsTr("Settings") + bjSip.emptyString
            }
            Icon{
                font.pointSize: 20
                anchors.verticalCenter: parent.verticalCenter
                symbol: "\uf013"
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
                    checked: !theme.isLightMode
                    onToggled: () => {
                        theme.isLightMode = !checked
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
