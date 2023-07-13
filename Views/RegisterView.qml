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
            label: "Username"
            width: parent.width
        }

        CustomSpinBox{
            id: extension
            label: "Extension"
            width: parent.width
        }

        CustomTextField{
            id: pass1
            label: "Password"
            echoMode: TextInput.Password
            width: parent.width
        }

        CustomTextField{
            id: pass2
            label: "Repeat Password"
            echoMode: TextInput.Password
            width: parent.width
        }

        CustomLink{
            viewName: loginView
            CustomText{
                color: theme.accentColor
                text: "Login"
            }
        }

        CustomButton{
            width: 100
            height: 40
            col: theme.successColor
            textColor: theme.textColor
            text: "Register"
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
