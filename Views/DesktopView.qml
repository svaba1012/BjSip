import QtQuick
import QtQuick.Controls

import "../Components/Calls"
import "../Components/Users"
import "../Components/Calls/IncomingCallPopup"

Row {
    id: desktopView
    anchors.fill: parent

    MenuView{
        id: menuView
        initialWidth: desktopView.width * 0.4
        width: desktopView.width * 0.4
        height: desktopView.height
        isDrawer: true
    }

    StackView{
        id: mainView
        z: 10
        width: desktopView.width - menuView.width
        height: desktopView.height
        replaceEnter: null
        replaceExit: null
        initialItem: callEndedView
        Component{
            id: callView
            CallView{}
        }
        Component{
            id: callEndedView
            CallEnded{}
        }
        Component{
            id: addNewContactView
            AddNewContact{}
        }
        Component{
            id: startView
            Rectangle{}
        }
    }

    IncomingCallPopup{
        visible: bjSip.hasIncomingCall
    }

}
