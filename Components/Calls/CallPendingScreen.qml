import QtQuick
import QtMultimedia

import "../Reusables"
import "./CallPendingDots"

Rectangle{
    property var buddies: appState.buddies
    id: pendingScreen
    anchors.fill: parent


    Column{
        id: mainColumn
        anchors.centerIn: parent
        spacing: pendingScreen.height * 0.03
        AvatarGroup{
            id: avatarGroup
            avatarSize: 100
            anchors.horizontalCenter: parent.horizontalCenter
            alts: buddies.map(buddy => buddy.contact_name)
            maxNum: 3
        }
        CustomText{
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 18
            text: qsTr("Calling ") + bjSip.emptyString + buddies.filter((buddy, i) => i < avatarGroup.maxNum)
                .reduce((acc, buddy, i, arr) =>{
                if(i === arr.length - 1){
                    return acc + buddy.contact_name;
                }
                if(i === arr.length - 2 && buddies.length <= avatarGroup.maxNum){
                    return acc + buddy.contact_name + qsTr(" and ");
                }
                return acc + buddy.contact_name + ", ";
            }, "") + ((buddies.length > avatarGroup.maxNum) ? (qsTr(" and ") + `${buddies.length - avatarGroup.maxNum}` + qsTr(" more ")) : "")
        }
        CallPendingDots{
            topPadding: 30
            dotSize: avatarGroup.avatarSize * 0.3
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}


