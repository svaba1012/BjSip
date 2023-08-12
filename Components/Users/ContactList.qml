import QtQuick
import QtQuick.Controls

import "../Reusables"

import "/scripts/Models/contact-model.js" as ContactModel

ScrollView{
    clip: true // Set to true to clip content outside the viewable area
    contentWidth: parent.width // Width of the content item
    contentHeight: column.height // Height of the content item

    Column {
        id: column
        width: parent.width - 20
        padding: 10
        topPadding: 5
        spacing: 5

        Component.onCompleted: () => {
            appState.contacts = ContactModel.getContacts(appState.user.user_id);
            console.log(appState.contacts.length);
        }

        CustomLink{
            stackView: mainView
            viewName: addNewContactView
            height: 20
            width: 200
            anchors.horizontalCenter: parent.horizontalCenter
            Row{
                height: parent.height
                spacing: 5
                Icon{
                    symbol: "\uf234"
                    font.pointSize: 12
                    color: theme.accentColor
                }
                CustomText{
                    text: qsTr("Add new contact") + bjSip.emptyString
                    font.pointSize: 12
                    color: theme.accentColor
                }
            }
        }

        Repeater{
            model: appState.contacts
            ContactListItem{
                required property int index;
                contact: appState.contacts[index]
            }
        }

    }
}
