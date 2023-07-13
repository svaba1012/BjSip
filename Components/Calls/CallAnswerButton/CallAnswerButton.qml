import QtQuick

import "../../Reusables"



RoundedButton{
    property int dur: 1000
    id: btn
    color: theme.successColor
    symbol: "\uf095"
    textColor: theme.backgroundColor

    CallAnswerButtonAnimatedBorder{}
    CallAnswerButtonAnimatedBorder{delay: 300}

    SequentialAnimation{
        running: true
        loops: Animation.Infinite
        RotationAnimation{
            target: btn
            from: 0
            to: 300
            direction: RotationAnimation.Counterclockwise
            duration: dur * 0.1
        }
        RotationAnimation{
            target: btn
            from: 300
            to: 60
            direction: RotationAnimation.Clockwise
            duration: dur * 0.1
        }
        RotationAnimation{
            target: btn
            from: 60
            to: 330
            direction: RotationAnimation.Counterclockwise
            duration: dur * 0.1
        }
        RotationAnimation{
            target: btn
            from: 330
            to: 30
            direction: RotationAnimation.Clockwise
            duration: dur * 0.1
        }
        RotationAnimation{
            target: btn
            from: 30
            to: 345
            direction: RotationAnimation.Counterclockwise
            duration: dur * 0.1
        }
        RotationAnimation{
            target: btn
            from: 345
            to: 15
            direction: RotationAnimation.Clockwise
            duration: dur * 0.1
        }
        RotationAnimation{
            target: btn
            from: 15
            to: 0
            direction: RotationAnimation.Counterclockwise
            duration: dur * 0.1
        }
        RotationAnimation{
            target: btn
            from: 0
            to: 0
            direction: RotationAnimation.Clockwise
            duration: dur * 0.3
        }
    }
}



