import QtQuick

Item {
    property bool isLightMode: true
    readonly property string primaryColor: isLightMode ? "#21a179" : "#478978"
    readonly property string secondaryColor: isLightMode ? "#70ae6e" : "#5E8C61"
    readonly property string accentColor: "#768948"
    readonly property string backgroundColor: isLightMode ? "#D4DDD4" : "#313628"
    readonly property string menuColor: isLightMode ? "#9FB49F" : "#364A3D"
    readonly property string textColor: isLightMode ? "#313628" : "#BED8BE"
    readonly property string successColor: "#09e85e"
    readonly property string dangerColor: "#8c271e"


//  #5E8C61 #478978



}
