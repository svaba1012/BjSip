import QtQuick
import QtQuick.Controls

import "../Components/Calls"
import "../Components/Users"


StackView{
    id: mainView
    anchors.fill: parent
    initialItem: menuView
    replaceEnter: null
    replaceExit: null
    Component.onCompleted: () => {
        if(!visible){
            return;
        }
        appState.optionView = settingsView
        appState.mainView = mainView
    }
    Component{
        id: menuView
        MenuView{}
    }
    Component{
        id: callView
        CallView{
            property bool isInCall: true
        }
    }
    Component{
        id: callEndedView
        CallEnded{color: theme.backgroundColor}
    }
    Component{
        id: addNewContactView
        AddNewContact{
            color: theme.backgroundColor
            withBack: true
        }
    }
    Component{
        id: settingsView
        SettingView{color: theme.backgroundColor}
    }
}



