import QtQuick

import "../Reusables"

import "/scripts/Models/contact-model.js" as ContactModel


Rectangle{
    property bool withBack: false
    CustomLink{
        stackView: mainView
        viewName: menuView
        anchors.left: parent.left
        anchors.top: parent.top
        height: 30
        width: 30
        Icon{
            font.pointSize: 20
            symbol: "\uf060"
            visible: withBack
        }
    }
    Column{
        width: 200
        anchors.centerIn: parent
        spacing: 20
        CustomTextField{
            id: contactName
            label: "Contact Name"
            width: parent.width
        }
        CustomSpinBox{
            id: extension
            label: "Extension"
            width: parent.width
        }
        CustomButton{
            width: 100
            height: 40
            col: theme.successColor
            textColor: theme.textColor
            text: "Add Contact"
            anchors.horizontalCenter: parent.horizontalCenter
            onClick: () => {
                ContactModel.addContact(contactName.value, extension.value, appState.user.user_id);
                console.log("Implement later and check what to do");
            }
        }
    }
}

