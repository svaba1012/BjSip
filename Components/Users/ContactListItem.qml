import QtQuick
import QtQuick.Layouts

import "../Reusables"


RowLayout {
    id:contactItem
    width: parent.width
    required property var contact;
    Avatar{
        id: contactAvatar
        alt: contact.contact_name
    }

    CustomText{
        id: contactName
        Layout.leftMargin: 1
        text: contact.contact_name
        font.pointSize: parent.height * 0.3
    }

    Item{
        Layout.fillWidth: true
    }

    Row{
        id: contactItemButtons
        Layout.alignment: Qt.AlignRight
        spacing: 15
        RoundedButton{
            size: 25
            anchors.verticalCenter: parent.verticalCenter
            iconSize: 1
            symbol: "\uf03d"
            onClick: () => console.log("Calling " + contact.extension)
        }
        RoundedButton{
            size: 25
            anchors.verticalCenter: parent.verticalCenter
            iconSize: 1
            symbol: "\uf095"
            onClick: () => {
                console.log("Poziv")
                console.log(bjSip.bjCall);
                appState.buddies = [];
                appState.buddies.push(contact);
                mainView.replace(callView);
                bjSip.makeCall(contact.extension);
            }
        }
    }
}
