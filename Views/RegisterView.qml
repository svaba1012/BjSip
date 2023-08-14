import QtQuick

import "../Components/Reusables"
import "../Components/Forms"



Item {
    id: registerView
    Row{
        height: parent.height
        RegisterForm{
            height: registerView.height
            width: appWindow.width >= 640 ? registerView.width / 2 : registerView.width
        }
        AppLogoWithText{
            visible: appWindow.width >= 640
            width: registerView.width / 2
            height: registerView.height
        }
    }
}
