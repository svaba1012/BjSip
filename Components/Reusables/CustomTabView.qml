import QtQuick
import QtQuick.Controls

Rectangle {
    id: tabBox
    default property alias children:  view.children
    property var tabLabels
    property var tabs
    property int currentIndex: -1
//    property int minWidth: tabBar.width
    property int potencialWidth: 0
    width: parent.width
//    width: potencialWidth > minWidth ? potencialWidth : minWidth

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

        Rectangle{
            height: tabBox.height - tabBar.height // - borderLine.height
            width: parent.width
            color: theme.menuColor
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
