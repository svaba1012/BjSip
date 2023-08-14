import QtQuick
import QtQuick.Layouts

import "../Components/Reusables"
import "../Components/Forms"


Item {
    id: loginView
    Row{
        height: parent.height
        LoginForm{
            height: loginView.height
            width: appWindow.width >= 640 ? loginView.width / 2 : loginView.width
        }
        AppLogoWithText{
            visible: appWindow.width >= 640
            width: loginView.width / 2
            height: loginView.height
        }
    }
}
