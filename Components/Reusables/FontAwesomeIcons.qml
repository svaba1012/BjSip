import QtQuick 2.0

Item {
    id: fonts
    readonly property FontLoader fontAwesomeSolid: FontLoader {
        source: "/fonts/Resources/Fonts/fa-solid.otf"
    }
    readonly property string solidIcons: fonts.fontAwesomeSolid.name
}


