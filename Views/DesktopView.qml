import QtQuick
import QtQuick.Controls

import "../Components/Calls"
import "../Components/Users"
import "../Components/Calls/IncomingCallPopup"

Row {
    id: desktopView
    anchors.fill: parent

    Component.onCompleted: () => {
       if(!visible){
           return;
       }
        appState.optionView = settingsView
        appState.mainView = mainView
    }

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
        initialItem: settingsView

        Component{
            id: callView
            CallView{
                color: theme.backgroundColor
                property bool isInCall: true
            }
        }
        Component{
            id: callEndedView
            CallEnded{color: theme.backgroundColor}
        }
        Component{
            id: addNewContactView
            AddNewContact{color: theme.backgroundColor}
        }
        Component{
            id: startView
            Rectangle{color: theme.backgroundColor}
        }
        Component{
            id: settingsView
            SettingView{color: theme.backgroundColor}
        }
    }

    IncomingCallPopup{
        visible: bjSip.hasIncomingCall
    }
}
