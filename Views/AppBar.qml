import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../Components/Reusables"

Rectangle{
    color: theme.primaryColor
    width: parent.width
    z: 100
    RowLayout{
        width: parent.width
        height: parent.height
        AppLogo{
            Layout.leftMargin: 10
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: parent.height
        }
        CustomText{
            text: qsTr("BjSip") + bjSip.emptyString
            font.pointSize: 18

        }

        Item{
            Layout.fillWidth: true
        }
        RoundedButton{
            Layout.alignment: Qt.AlignRight
            Layout.rightMargin: 10
            iconSize: 1
            size: 20
            symbol: "\uf013"
            onClick: () => {
                if(appState.user.username){
//                    if(appState.optionView.status !== StackView.Active){
                        appState.mainView.replace(appState.optionView)
//                    }
                }

            }
        }
    }
}
