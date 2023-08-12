import QtQuick
import QtQuick.Controls


ScrollView{
//    anchors.fill: parent
    clip: true
    contentWidth: parent.width
    contentHeight: column.height
    Column {
        id: column
        width: parent.width
        padding: 10
        topPadding: 5
        spacing: 5
        Repeater{
            model: 0//25
            CallHistoryItem{}
        }
    }
}
