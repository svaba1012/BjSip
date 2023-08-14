import QtQuick

Grid{
    id: callGrid
    function calcNumOfRows(numOfUsers){
        if(numOfUsers < 3){
            return 1;
        }else if(numOfUsers < 7){
            return 2;
        }popup.height + 20
    }

    rows: calcNumOfRows(appState.buddies.length)
    columns: appState.buddies.length / rows
    anchors.fill: parent

    Repeater{
        model: appState.buddies
        VoiceCallUserBox{
            required property int index;
            buddy: appState.buddies[index]
        }
    }
}
