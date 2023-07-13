const changeBrightness = (col, brightness) => {
    var color = Qt.color(col)
    var r = color.r + brightness;
    var g = color.g + brightness;
    var b = color.b + brightness;
    return Qt.rgba(r, g, b, color.a);
}
