import QtQuick 2.15
import QtQuick.Controls.Basic 2.5

CusButton {
    backgroundColorNormal: "#ffffff"
    backgroundColorHovered: "#eaf6fd"
    backgroundColorPressed: "#d7ebfa"
    backgroundColorDisable: "#b6bdc5"

    borderColor: enabled ? "#38a9e4" : "#b6bdc5"
    borderWidth: 1

    textColor: enabled ? "#38a9e4" : "#ffffff"
}
