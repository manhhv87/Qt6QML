import QtQuick 2.15

import "../"

/**
 * This is the tab for showing the windows settings
 * It is used in the Settings Elements.
 */
TabPage {
    id: windowRainTab

    property alias currentSliderValue: rainSlider.value
    property alias currentSliderActualValue: rainSlider.actualValue
    property real currentRainValue

    signal checkStateTriggered()

    /**
    * A custom item for Rain settings.
    * (\see ActualValueSlider)
    */
    ActualValueSlider {
        id: rainSlider
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 70
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -100

        width: 520
        valueSliderHeight: 54
        backgroundImage: "qrc:/Images/rain/rain_scale.png"

        /**
         * style the balloon
         */
        balloonHeight: 56
        balloonTriangleHeight: 20
        balloonImage: "qrc:/Images/rain/balloon/balloon_minsize.svg"
        balloonTriangleImage: "qrc:/Images/rain/balloon/balloon_triangle.svg"
        balloonText: Math.floor(value) + " ml"

        /**
         * style the knob
         */
        knobImagePressed: "qrc:/Images/fader/button_pressed.svg"
        knobImageNormal: "qrc:/Images/fader/button_normal.svg"

        /**
         * style the needle
         */
        needleImage: "qrc:/Images/rain/needle.svg"

        /**
         * style the focus
         */
        focusVisible: false
        focusImage: ""

        actualValue: currentRainValue

        minValue: 0
        maxValue: 60
        onValueChanged: checkStateTriggered()
    }
}
