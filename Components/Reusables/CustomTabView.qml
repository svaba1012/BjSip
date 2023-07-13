import QtQuick
import QtQuick.Controls

Rectangle {
    id: tabBox
    default property alias children:  view.children
    property var tabLabels
    property var tabs
    property int currentIndex: -1

    color: "red"

    Column{
        width: parent.width
        Row{
            id: tabBar
            height: 50
            Repeater{
                model: tabs
                CustomTabButton{
                    required property int index
                    required property string modelData
                    i: index
                    text: tabs[index].label
                    targetView: tabs[index].id
                    iconSymbol: tabs[index].iconSymbol
                    tabView: tabBox
                    stackView: view
                    height: 50
                    width: tabBox.width / tabs.length
                }
            }
        }
        Row{
            id: borderLine
            height: 4
            Repeater{
                model: tabs.length
                Rectangle{
                    required property int index
                    height: 4
                    width: tabBox.width / tabs.length
                    color: index === currentIndex ? theme.successColor : theme.accentColor
                }
            }
        }
        Rectangle{
            height: tabBox.height - tabBar.height // - borderLine.height
            width: parent.width
            color: theme.backgroundColor
            StackView{
                id: view
                anchors.fill: parent
                Component.onCompleted: {
                    //init children of stack view
                    for(let i = tabs.length - 1; i >= 0; i-- ){
                        view.replace(tabs[i].id)
                    }
                    currentIndex = 0
                }
            }
        }
    }
}
