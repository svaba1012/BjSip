import QtQuick
import QtQuick.Controls


Circle {
    property int size: 50
    property alias source: accImage.source
    property string alt: "User"
    r: size
    color: theme.primaryColor


    Image {
        id: accImage
        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        visible: source && source.length > 0
    }

    CustomText{
        text: alt[0].toUpperCase()
        font.pixelSize: r * 0.5
        anchors.centerIn: parent
        color: theme.backgroundColor
    }

}




//Item {
//    width: 200
//    height: 200

//    property alias source: image.source

//    Rectangle {
//        id: container
//        width: Math.min(parent ? parent.width : 200, parent ? parent.height : 200)
//        height: width
//        color: "transparent"
//        border.width: 2
//        border.color: "black"

//        Canvas {
//            id: canvas
//            anchors.fill: parent

//            onPaint: {
//                var ctx = getContext("2d");
//                ctx.clearRect(0, 0, width, height);

//                // Draw circular clip
//                ctx.beginPath();
//                ctx.arc(width * 0.5, height * 0.5, Math.min(width, height) * 0.5, 0, 2 * Math.PI);
//                ctx.closePath();
//                ctx.clip();

//                // Draw image
//                ctx.drawImage(image.source, 0, 0, width, height);
//            }
//        }

//        Image {
//            id: image
//            anchors.centerIn: parent
//            fillMode: Image.PreserveAspectFit
//            visible: false
//        }
//    }
//}
