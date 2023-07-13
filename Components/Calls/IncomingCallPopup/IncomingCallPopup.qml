import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtMultimedia

import "../../Reusables"
import "../CallAnswerButton"

Popup {
    id: popup
    property bool isOnScreen: true
    property real positionOffset: 120//popup.height + 20
    property int animationDuration: 300
    x: (appWindow.width - popup.width) - 20
    y: appWindow.height - positionOffset

    modal: false

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    topPadding: 2
    padding: 10
    background: Rectangle{
        color: theme.accentColor
        radius: 5
    }

    ColumnLayout{
        anchors.fill: parent
        RowLayout{
            id:headerRow
            width: parent.width
            CustomText{
                text: "Incoming call..."
            }
            Item{
                Layout.fillWidth: true
            }
            Rectangle{
                id: slideBox
                color: theme.accentColor
                width: 40
                height: width
                radius: 5
                RoundedButton{
                    id: slideButton
                    size: parent.width
                    Layout.alignment: Qt.AlignRight
                    color: "transparent"
                    iconSize: 0.8
                    symbol: "\uf107"
                    onClick: () => {
                        if(isOnScreen){
                            slideOutAnim.start()
                            isOnScreen = false
                            audioOutput.muted = true
                            return;
                        }
                        slideInAnim.start()
                        isOnScreen = true
                        audioOutput.muted = false
                    }
                }
                Rectangle{
                    width: parent.width
                    height: parent.radius
                    color: parent.color
                    anchors.bottom: parent.bottom
                }
            }

        }

        RowLayout{
            id: callRow
            Avatar{}
            CustomText{
                text: bjSip.incomingBuddyUri
                rightPadding: 30
            }
            RoundedButton{
                color: theme.dangerColor
                textColor: theme.backgroundColor
                symbol: "\uf095"
                onClick: () => {
                    bjSip.cancelIncomingCall()
                    ringtone.stop()
                }
            }
            CallAnswerButton{
                onClick: () => {
                    //NOT TESTED

                    console.log(bjSip.incomingBuddyUri)
                    let extension = bjSip.incomingBuddyUri.substring(1,1);
                    //find contact with that extension
                    //push contact into buddies

                    //NOT TESTED
                    bjSip.answerIncomingCall()
                    ringtone.stop()
                    mainView.replace(callView)
                }
            }
        }
    }


    MediaPlayer{
        id: ringtone
        loops: 5
        audioOutput: AudioOutput{
            id: audioOutput
        }
        source: "/sounds/Resources/Sounds/ringtone01.mp3"
    }
    onOpened: () => ringtone.play()

    ParallelAnimation{
        id: slideOutAnim
        PropertyAnimation{
            target: popup
            property: "positionOffset"
            duration: animationDuration
            from: popup.height + 20
            to: 0
        }
        RotationAnimation{
            target: slideButton
            duration: animationDuration
            from: 0
            to: 180
        }
        PropertyAnimation{
            target: slideBox
            property: "y"
            duration: animationDuration
            from: 0
            to: -slideBox.height
        }
    }

    ParallelAnimation{
        id: slideInAnim
        PropertyAnimation{
            target: popup
            property: "positionOffset"
            duration: animationDuration
            from: 0
            to: 120
        }
        RotationAnimation{
            target: slideButton
            duration: animationDuration
            from: 180
            to: 0
        }
        PropertyAnimation{
            target: slideBox
            property: "y"
            duration: animationDuration
            from: -slideBox.height
            to: 0
        }
    }
}
