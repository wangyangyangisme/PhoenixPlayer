pragma Singleton
import QtQuick 2.0
import Material 0.2

//import "Component"

QtObject {
    id: constValue

    readonly property real leftEdgeMargins: Units.dp(24)
    readonly property real itemHeight: Units.dp(64)
    readonly property real subHeaderHeight: Units.dp(48)
    readonly property real tinySpace: Units.dp(8)
    readonly property real cardSize: Units.dp(192)

}