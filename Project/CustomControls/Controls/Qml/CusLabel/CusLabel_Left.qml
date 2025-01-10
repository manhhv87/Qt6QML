import QtQuick 2.10
import QtQuick.Controls.Basic 2.2

Label {
    font.pixelSize: Config.fontSize_default
    color: Config.textColor
    height: Config.fixedHeight
    elide: Text.ElideRight
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignLeft
    // renderType: Text.NativeRendering
}
