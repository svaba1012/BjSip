import QtQuick
import QtQuick.Controls

import "../Components/Calls"
import "../Components/Users"


StackView{
    id: mainView
    anchors.fill: parent
    initialItem: callView
    Component{
        id: menuView
        MenuView{}
    }
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
        AddNewContact{
            withBack: true
        }
    }
}



