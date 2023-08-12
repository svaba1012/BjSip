import QtQuick

import "../Reusables"

Rectangle {
    id: callFooter
    property real arcRatio: 0.5
    property bool isSpread: true
    width: parent.width
    height: 100
    z: 10
    color: "grey"

    Row{
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.top
        QuaterCircle{
            r: parent.height  * arcRatio
            cordX: 0
            cordY: 0
            shapeColor: callFooter.color
            anchors.bottom: parent.bottom
        }
        Rectangle{
            width: 80
            height: parent.height
            radius: height * arcRatio
            color: callFooter.color
            RoundedButton{
                id: shrinkBtn
                size: 20
                iconSize: 1
                symbol: "\uf107"
                anchors.centerIn: parent
                z: 15
                onClick: () => {
                    if(isSpread){
                        shrinkAnim.start();
                        isSpread = false;
                        return;
                    }
                    spreadAnim.start();
                    isSpread = true;
                }
            }
            Rectangle{
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height * arcRatio
                color: parent.color
            }
        }
        QuaterCircle{
            r: parent.height  * arcRatio
            cordX: 1
            cordY: 0
            shapeColor: callFooter.color
            anchors.bottom: parent.bottom
        }
    }

    Rectangle{
        color: "transparent"
        clip: true
        anchors.fill: parent
        Row{
            height: 50
            z: 15
            spacing: 25
            anchors.centerIn: parent
            RoundedButton{
                textColor: theme.backgroundColor
                symbol: "\uf234"
            }
            RoundedButton{
                textColor: theme.backgroundColor
                symbol: "\uf03d"
            }
            RoundedButton{
                textColor: theme.backgroundColor
                symbol: "\uf539"
            }
            RoundedButton{
                textColor: theme.backgroundColor
                color: theme.dangerColor
                symbol: "\uf879"
                onClick: () => {
                    //!!! NOT TESTED
                    bjSip.hangOnOngoingCall();
                    //!!! NOT TESTED
                    mainView.replace(callEndedView)
                }
            }
        }
    }

    ParallelAnimation{
        id: shrinkAnim
        PropertyAnimation{
            target: callFooter
            property: "height"
            from: 100
            to: 0
            duration: 100
        }
        RotationAnimation{
            target: shrinkBtn
            from: 0
            to: 180
            duration: 100
        }
    }

    ParallelAnimation{
        id: spreadAnim
        PropertyAnimation{
            target: callFooter
            property: "height"
            from: 0
            to: 100
            duration: 100
        }
        RotationAnimation{
            target: shrinkBtn
            from: 180
            to: 0
            duration: 100
        }
    }
}
