import QtQuick
import QtQuick.Controls
import QtMultimedia

import "../Components/Calls"

Rectangle {

    function handleCallAccepted(){
        console.log("-----------Accepted-------------")
        callStackView.replace(ongoingCallView)
    }

    function handleCallDeclined(){
        console.log("Declined");
        mainView.replace(callEndedView);
    }

//    function handleCallStarted(){
//        console.log("CallStarted");
//        console.log(pendingCallSound.playbackState)
//        pendingCallSound.play()
//        console.log(pendingCallSound.playbackState)
//    }


    Connections{
        target: bjSip
        onCallAccepted: handleCallAccepted()
        onCallDeclined: handleCallDeclined()
//        onCallStarted: handleCallStarted()
    }

    Rectangle{
        height: parent.height - callFooter.height
        width: parent.width
        color: "red"
    }

//    MediaPlayer{
//        id: pendingCallSound
//        loops: 2
//        audioOutput: AudioOutput{}
//        source: "/sounds/Resources/Sounds/outgoing-call-tone01.mp3"

//    }

//    MediaPlayer{
//        id: buddyBusySound
//        loops: 1
//        audioOutput: AudioOutput{}
//        source: "/sounds/Resources/Sounds/busy-ringtone-1.mp3"
//    }


    StackView{
        id: callStackView
        height: parent.height - callFooter.height
        width: parent.width
        initialItem: pendingCallView

//        onCurrentItemChanged: () => {
//            console.log("StatusStack")
//            console.log(pendingCallView.status)
//            if(pendingCallView.status == StackView.Active){
//                pendingCallSound.play()
//            }else{
//                pendingCallSound.stop()
//            }
//        }
        Component{
            id: initialView
            Rectangle{}
        }
        Component{
            id: pendingCallView
            CallPendingScreen{
                property bool pendingCall: true
                color: theme.backgroundColor
            }
        }
        Component{
            id: ongoingCallView
            CallGrid{
            }
        }
    }

    CallFooter{
        id: callFooter
        anchors.bottom: parent.bottom
        color: theme.secondaryColor
    }
}
