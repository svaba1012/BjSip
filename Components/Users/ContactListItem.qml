import QtQuick
import QtQuick.Layouts

import "../Reusables"


RowLayout {
    id:contactItem
    width: parent.width
    required property var contact;

    Avatar{
        alt: contact.contact_name
    }

    CustomText{
        Layout.leftMargin: 1
        text: contact.contact_name
        font.pointSize: parent.height * 0.3
    }

    Item{
        Layout.fillWidth: true
    }

    Row{
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
                appState.buddies.push(contact);
                bjSip.makeCall(contact.extension);
                mainView.replace(callView);
            }
        }
    }
}
