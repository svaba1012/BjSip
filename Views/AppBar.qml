import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../Components/Reusables"

Rectangle{
    color: theme.primaryColor
    width: parent.width

    RowLayout{
        width: parent.width
        CustomText{
            text: qsTr("BjSip") + bjSip.emptyString
            font.pointSize: 18
            Layout.leftMargin: 10
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
