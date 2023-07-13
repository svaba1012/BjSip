import QtQuick
import QtQuick.Shapes

Shape {
    id: arc
    property int cordX: 0
    property int cordY: 0
    property real r: 10
    property string shapeColor: "red"
    width: r
    height: r

    // multisample, decide based on your scene settings
    layer.enabled: true
    layer.samples: 4


    ShapePath {
        fillColor: arc.shapeColor
        strokeColor: arc.shapeColor
        strokeWidth: 1
        capStyle: ShapePath.RoundCap

        PathAngleArc {
            centerX: cordX * arc.r; centerY: cordY * arc.r
            radiusX: arc.r; radiusY: arc.r
            // (0, 0) = 0  (1, 0) = 90 (0, 1) = 270 (1, 1) = 180
            startAngle: Math.abs(cordY * 270 - cordX * 90)
            sweepAngle: 90
        }
        PathLine{
            x: arc.width * (1 - cordX)
            y: arc.width * (1 - cordY)
        }
    }
}
