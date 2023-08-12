import QtQuick

import "../Reusables"

import "/scripts/Models/contact-model.js" as ContactModel


Rectangle{
    property bool withBack: false
    property bool isAddingContact: false
    Timer{
        id: addedContactTimer
        interval: 1500
        onTriggered: () => mainView.replace(startView)
    }
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
    CustomText{
        anchors.centerIn: parent
        font.pointSize: 16
        text: qsTr("New contact added successfuly") + bjSip.emptyString
        visible: isAddingContact
    }
    Column{
        width: 200
        anchors.centerIn: parent
        spacing: 20
        visible: !isAddingContact
        CustomTextField{
            id: contactName
            label: qsTr("Contact Name") + bjSip.emptyString
            width: parent.width
        }
        CustomSpinBox{
            id: extension
            label: qsTr("Extension") + bjSip.emptyString
            width: parent.width
        }
        CustomButton{
            col: theme.successColor
            textColor: theme.textColor
            text: qsTr("Add Contact") + bjSip.emptyString
            anchors.horizontalCenter: parent.horizontalCenter
            onClick: () => {
                ContactModel.addContact(contactName.value, extension.value, appState.user.user_id);
                console.log("Implement later and check what to do");
                appState.contacts = [...appState.contacts, {contact_name: contactName.value, extension: extension.value, creator_user_id: appState.user.user_id}];
                appState.contacts = appState.contacts.sort((a, b) => {
                    if(a.contact_name > b.contact_name){
                        return 1;
                    }else if(a.contact_name < b.contact_name){
                        return -1;
                    }
                    return 0;
                })
                isAddingContact = true;
                addedContactTimer.start();
            }
        }
    }
}

