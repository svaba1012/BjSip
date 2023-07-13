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
            label: "Username"
            width: parent.width
        }

        CustomTextField{
            id: password
            label: "Password"
            echoMode: TextInput.Password
            width: parent.width
        }

        CustomLink{
            viewName: registerView
            CustomText{
                color: theme.accentColor
                text: "Register"
            }
        }

        CustomButton{
            width: 100
            height: 40
            col: theme.successColor
            textColor: theme.textColor
            text: "Login"
            anchors.horizontalCenter: parent.horizontalCenter
            onClick: () => {
                appState.user = UserModel.loginUser(username.value, password.value)
                bjSip.registerAccount(appState.user.extension);
                console.log(appState.user.username)
                appView.replace(mainView)
            }
        }
    }
}

