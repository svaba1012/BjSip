import QtQuick
import QtQuick.Layouts 1.0

import "../Reusables"

import "/scripts/Utils/getBuddiesUsernames.js" as Buddy

Rectangle {
    Column{
        padding: 50
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        AvatarGroup{
            id: avatarGroup
            avatarSize: 80
            anchors.horizontalCenter: parent.horizontalCenter
            alts: appState.contacts.map(buddy => buddy.contact_name)
            maxNum: 3
        }
        CustomText{
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            text: Buddy.getBuddiesUsernames(appState.contacts, avatarGroup.maxNum)
        }
        CustomText{
            anchors.horizontalCenter: parent.horizontalCenter
            //status of ended call
            text: "Call rejected"
        }
    }
    RowLayout{
        spacing: 100
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        height: 100
        Column{
            spacing: 2
            RoundedButton{
                anchors.horizontalCenter: parent.horizontalCenter
                symbol: "\uf00d"
                color: theme.dangerColor
                textColor: theme.backgroundColor
                onClick: () => {
                    appState.buddies = []
                    mainView.replace(startView)
                }
            }
            CustomText{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Exit"
            }
        }

        Column{
            spacing: 2
            RoundedButton{
                anchors.horizontalCenter: parent.horizontalCenter
                symbol: "\uf095"
                color: theme.successColor
                textColor: theme.backgroundColor
                onClick: () => {
                    //Change later
//                    bjSip.makeCall(appState.contacts[0]);
                    mainView.replace(callView);
                }
            }
            CustomText{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Call again"
            }
        }
    }
}
