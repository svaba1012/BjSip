import QtQuick
import QtMultimedia

import "../Reusables"
import "./CallPendingDots"

Rectangle{
    property var buddies: appState.buddies
    id: pendingScreen
    anchors.fill: parent
    MediaPlayer{
        loops: 2
        audioOutput: AudioOutput{}
        source: "/sounds/Resources/Sounds/outgoing-call-tone01.mp3"
        Component.onCompleted: {play()}
    }
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
            text: "Calling " + buddies.filter((buddy, i) => i < avatarGroup.maxNum)
                .reduce((acc, buddy, i, arr) =>{
                if(i === arr.length - 1){
                    return acc + buddy.contact_name;
                }
                if(i === arr.length - 2 && buddies.length <= avatarGroup.maxNum){
                    return acc + buddy.contact_name + " and ";
                }
                return acc + buddy.contact_name + ", ";
            }, "") + ((buddies.length > avatarGroup.maxNum) ? (` and ${buddies.length - avatarGroup.maxNum} more`) : "")
        }
        CallPendingDots{
            topPadding: 30
            dotSize: avatarGroup.avatarSize * 0.3
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}


