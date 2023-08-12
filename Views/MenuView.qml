import QtQuick
import QtQuick.Controls

import "../Components/Reusables"
import "../Components/Users"
import "../Components/Calls"


Rectangle {
    id: menu
    property bool isDrawer: false
    property bool isSpread: true
    property int initialWidth
    z: 11

    CustomTabView{
        id: menuTab
        height:  parent.height
//        potencialWidth: parent.width
        clip: true
        tabs: [
            {label: qsTr("Contacts") + bjSip.emptyString, id: contacts, iconSymbol: "\uf0c0"},
            {label: qsTr("Call History") + bjSip.emptyString, id: callHistory, iconSymbol: "\uf1da"}
        ]
        ContactList{
            id: contacts
        }
        CallHistory{
            id: callHistory
        }
    }

    //button for triggering show hide animation on side menu in desktop version
    RoundedButton{
        id: drawerButton
        visible: isDrawer
        color: "transparent"
        iconSize: 1
        symbol: "\uf104"
        anchors.top: parent.top
        anchors.left: parent.right
        onClick: () => {
            if(isSpread){
                shrinkMenuAnimation.start()
            }else{
                spreadMenuAnimation.start()
            }
            menu.isSpread = !menu.isSpread
        }
    }

    //animation for showing and hiding side menu in desktop version
    ParallelAnimation{
        id: shrinkMenuAnimation
        PropertyAnimation{
            target: menu
            property: "width"
            to: 0
            from: initialWidth
            duration: 200
        }
        RotationAnimation{
            target: drawerButton
            duration: 200
            from: 0
            to: 180
        }
    }

    ParallelAnimation{
        id: spreadMenuAnimation
        PropertyAnimation{
            target: menu
            property: "width"
            to: initialWidth
            from: 0
            duration: 200
        }
        RotationAnimation{
            target: drawerButton
            duration: 200
            from: 180
            to: 0
        }
    }
}
