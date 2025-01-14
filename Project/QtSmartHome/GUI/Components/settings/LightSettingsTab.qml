import QtQuick 2.15

import "../"

/**
 * This is the tab for showing the light settings
 * It is used in the Settings Elements.
 */
TabPage {
    id:lightSettingsTab

    property alias currentSliderValue: lightSlider.value
    property alias currentSliderActualValue: lightSlider.actualValue
    property int currentLuxValue

    signal checkStateTriggered()

    /**
    * A custom item for Light(Lux) settings.
    * (\see ActualValueSlider)
    */
    ActualValueSlider {
        id: lightSlider
        anchors.centerIn: parent

        width: 520
        valueSliderHeight: 120
        backgroundImage: "qrc:/Images/light/light_scale.png"

        /**
         * style the balloon
         */
        balloonHeight: 56
        balloonTriangleHeight: 20
        balloonImage: "qrc:/Images/light/balloon/balloon_minsize.svg"
        balloonTriangleImage: "qrc:/Images/light/balloon/balloon_triangle.svg"

        /**
         * style the knob
         */
        knobImagePressed: "qrc:/Images/fader/button_pressed.svg"
        knobImageNormal: "qrc:/Images/fader/button_normal.svg"

        /**
         * style the needle
         */
        needleImage: "qrc:/Images/light/needle.svg"

        /**
         * style the focus
         */
        focusVisible: false
        focusImage: ""

        value:  25
        balloonText: "twilight"
        minValue: 0
        maxValue: 60

        onValueChanged: {
            if(value < 10)
                balloonText = "very dark"
            else if(value <= 20)
                balloonText = "dark"
            else if(value <= 30)
                balloonText = "twilight"
            else if(value <= 40)
                balloonText = "light"
            else if(value <= 50)
                balloonText = "very light"
            else
                balloonText = "very very light"
            checkStateTriggered()
        }
        actualValue: currentLuxValue / 12 * 60
    }
}
