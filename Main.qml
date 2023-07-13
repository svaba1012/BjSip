import QtQuick
import QtQuick.Window
import QtQuick.LocalStorage
import QtQuick.Controls
import QtQuick.Layouts

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

    //init localstorage database
    Component.onCompleted: Db.initDb()
    Column{
        anchors.fill: parent
        Rectangle{
            color: theme.accentColor
            width: parent.width
            height: 30
            RowLayout{
                width: parent.width
                CustomText{
                    text: "BjSip"
                    font.pointSize: 18
                    Layout.leftMargin: 10
                }
                Item{
                    Layout.fillWidth: true
                }
                RoundedButton{
                    Layout.alignment: Qt.AlignRight
                    Layout.rightMargin: 10
                    iconSize: 1
                    size: 20
                    symbol: "\uf013"
                }
            }

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
