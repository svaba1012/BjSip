import QtQuick

import "../Components/Reusables"

import "/scripts/Models/user-model.js" as UserModel


Item {
    Column{
        id: registerBox
        width: 200
        anchors.centerIn: parent
        spacing: 20
        CustomTextField{
            id: username
            label: qsTr("Username") + bjSip.emptyString
            width: parent.width
        }

        CustomSpinBox{
            id: extension
            label: qsTr("Extension") + bjSip.emptyString
            width: parent.width
        }

        CustomTextField{
            id: pass1
            label: qsTr("Password") + bjSip.emptyString
            echoMode: TextInput.Password
            width: parent.width
        }

        CustomTextField{
            id: pass2
            label: qsTr("Repeat Password") + bjSip.emptyString
            echoMode: TextInput.Password
            width: parent.width
        }

        CustomLink{
            viewName: loginView
            CustomText{
                color: theme.accentColor
                text: qsTr("Login") + bjSip.emptyString
            }
        }

        CustomButton{

            col: theme.successColor
            textColor: theme.textColor
            text: qsTr("Register")
            anchors.horizontalCenter: parent.horizontalCenter
            onClick: () => {
                if(pass1.value !== pass2.value){
                    console.log("Password mismatch");
                    return;
                }
                if(pass1.value.length < 3 || username.value.length < 3){
                    console.log("All fields must be at least 3")
                }

                UserModel.registerUser(username.value, pass1.value, extension.value);
            }
        }
    }
}
