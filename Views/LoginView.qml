import QtQuick

import "../Components/Reusables"

import "/scripts/Models/user-model.js" as UserModel


Item {
    Column{
        id: column
        width: 250
        anchors.centerIn: parent
        spacing: 20
        CustomTextField{
            id: username
            label: qsTr("Username") + bjSip.emptyString
            width: parent.width
        }

        CustomTextField{
            id: password
            label: qsTr("Password") + bjSip.emptyString
            echoMode: TextInput.Password
            width: parent.width
        }

        CustomLink{
            viewName: registerView
            CustomText{
                color: theme.accentColor
                text: qsTr("Register") + bjSip.emptyString
            }
        }

        CustomButton{

            col: theme.successColor
            textColor: theme.textColor
            text: qsTr("Login") + bjSip.emptyString
            anchors.horizontalCenter: parent.horizontalCenter
            function submit(){
                appState.user = UserModel.loginUser(username.value, password.value)
                bjSip.registerAccount(appState.user.extension);
                console.log(appState.user.username)
                appView.replace(mainView)
            }
            onClick: () => submit()

//            Keys.onEnterPressed: () => submit()
//            Keys.onReturnPressed: () => submit()
        }
    }
}

