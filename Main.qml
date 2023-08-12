import QtQuick
import QtQuick.Window
import QtQuick.LocalStorage
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

import "./Views"
import "./Components/Reusables"

import "/scripts/Models/local-storage.js" as Db


ApplicationWindow {
    id: appWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("BJ Sip")
    color: theme.backgroundColor

    //global components for accessing icons and theme colors
    property string globalFont: "Helvetica Neue"
    FontAwesomeIcons{
        id: fontawesome
    }
    ColorTheme{
        id: theme
    }

    //app state
    AppState{
        id: appState
    }

    onClosing: () => console.log("Closing")

    //init localstorage database
    Component.onCompleted: Db.initDb()
    Column{
        anchors.fill: parent
        AppBar{
            height: 30
        }
        StackView{
            id: appView
            width: parent.width
            height: parent.height - 30
            initialItem: loginView
            Component{
                id: loginView
                LoginView{}
            }
            Component{
                id: registerView
                RegisterView{}
            }
            Component{
                id: mainView
                Item{
                    AndroidView{visible: parent.width < 640 }
                    DesktopView{ visible: parent.width >= 640}
                }
            }
        }

    }
}
