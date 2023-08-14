import QtQuick

import "../Reusables"

import "/scripts/Models/user-model.js" as UserModel


Rectangle{
    color: "transparent"
    Column{
        id: registerBox
        width: parent.width * 0.8
        anchors.centerIn: parent
        spacing: 20
        CustomTextField{
            id: username
            label: qsTr("Username") + bjSip.emptyString
            width: parent.width
            icon: "\uf007"
        }

        CustomSpinBox{
            id: extension
            label: qsTr("Extension") + bjSip.emptyString
            width: parent.width
            icon: "\uf095"
        }

        CustomTextField{
            id: pass1
            label: qsTr("Password") + bjSip.emptyString
            echoMode: TextInput.Password
            width: parent.width
            icon: "\uf023"
        }

        CustomTextField{
            id: pass2
            label: qsTr("Repeat Password") + bjSip.emptyString
            echoMode: TextInput.Password
            width: parent.width
            icon: "\uf023"
        }

        CustomLink{
            viewName: loginView
            CustomText{
                color: theme.accentColor
                text: qsTr("Login") + bjSip.emptyString
                font.pointSize: 14
            }
        }

        CustomButton{

            col: theme.successColor
            textColor: theme.textColor
            text: qsTr("Register")
            anchors.horizontalCenter: parent.horizontalCenter
            preferredWidth: 0.4 * parent.width
            fontSize: 16
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
