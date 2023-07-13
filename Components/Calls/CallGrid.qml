import QtQuick

Grid{
    id: callGrid
    function calcNumOfRows(numOfUsers){
        if(numOfUsers < 3){
            return 1;
        }else if(numOfUsers < 7){
            return 2;
        }
    }

    rows: calcNumOfRows(appState.contacts.length)
    columns: appState.contacts.length / rows
    anchors.fill: parent

    Repeater{
        model: appState.contacts
        VoiceCallUserBox{
            required property int index;
            buddy: appState.contacts[index]
        }
    }
}
