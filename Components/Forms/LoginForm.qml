import QtQuick
import "../Reusables"

import "/scripts/Models/user-model.js" as UserModel

Rectangle{
    color: "transparent"
    Column{
        id: column
        width: parent.width * 0.8
        anchors.centerIn: parent
        spacing: 20

        CustomTextField{
            id: username
            label: qsTr("Username") + bjSip.emptyString
            width: parent.width
            icon: "\uf007"
        }

        CustomTextField{
            id: password
            label: qsTr("Password") + bjSip.emptyString
            echoMode: TextInput.Password
            width: parent.width
            icon: "\uf023"
        }

        CustomLink{
            viewName: registerView
            CustomText{
                color: theme.accentColor
                text: qsTr("Register") + bjSip.emptyString
                font.pointSize: 14
            }
        }

        CustomButton{

            col: theme.successColor
            textColor: theme.textColor
            text: qsTr("Login") + bjSip.emptyString
            anchors.horizontalCenter: parent.horizontalCenter
            fontSize: 16
            preferredWidth: parent.width * 0.4
            function submit(){
                appState.user = UserModel.loginUser(username.value, password.value)
                bjSip.registerAccount(appState.user.extension);
                console.log(appState.user.username)
                appView.replace(mainView)
            }
            onClick: () => submit()

        }
    }
}
