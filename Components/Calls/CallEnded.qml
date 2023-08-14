import QtQuick
import QtQuick.Layouts 1.0

import "../Reusables"

import "/scripts/Utils/getBuddiesUsernames.js" as Buddy

Rectangle {
    function mapStatusCodeToText(code){
        console.log(code)
        if(code === 480){
            return qsTr("User temporarily unavailable") + bjSip.emptyString;
        }
        if(code === 486){
            return qsTr("User is busy") + bjSip.emptyString;
        }
        if(code === 487){
            return qsTr("No answer") + bjSip.emptyString;
        }
        if(code === 503){
            return qsTr("User is offline") + bjSip.emptyString;
        }
        if(code === 603){
            return qsTr("Call declined") + bjSip.emptyString;
        }
        return qsTr("Call ended") + bjSip.emptyString;
    }
    Column{
        padding: 50
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10
        AvatarGroup{
            id: avatarGroup
            avatarSize: 80
            anchors.horizontalCenter: parent.horizontalCenter
            alts: appState.buddies.map(buddy => buddy.contact_name)
            maxNum: 3
        }
        CustomText{
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: Buddy.getBuddiesUsernames(appState.buddies, avatarGroup.maxNum)
        }
        CustomText{
            anchors.horizontalCenter: parent.horizontalCenter
            //status of ended call
            font.pointSize: 14
            text:   mapStatusCodeToText(bjSip.callStatus)
        }
    }
    RowLayout{
        spacing: 90
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
                font.pointSize: 16
                text: qsTr("Exit") + bjSip.emptyString
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
                    bjSip.makeCall(appState.buddies[0].extension);
                    mainView.replace(callView);
                }
            }
            CustomText{
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 16
                text: qsTr("Call again") + bjSip.emptyString
            }
        }
    }
}
