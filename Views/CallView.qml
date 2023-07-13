import QtQuick
import QtQuick.Controls
import "../Components/Calls"

Rectangle {

    function handleCallAccepted(){
        console.log("-----------Accepted-------------")
    }

    function handleCallDeclined(){
        console.log("Declined");
    }

    Connections{
        target: bjSip
        onCallAccepted: handleCallAccepted()
        onCallDeclined: handleCallDeclined()
    }

    Rectangle{
        height: parent.height - callFooter.height
        width: parent.width
        color: "red"
    }

    StackView{
        height: parent.height - callFooter.height
        width: parent.width
        initialItem: pendingCallView
        Component{
            id: pendingCallView
            CallPendingScreen{}
        }
        Component{
            id: callView
            CallGrid{}
        }
    }
    CallFooter{
        id: callFooter
        anchors.bottom: parent.bottom
    }


}
