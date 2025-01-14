import QtQuick 2.15

import "../"

/**
 * This is the tab for showing the jalousie settings
 * It is used in the Settings Elements.
 */
TabPage {
    id: jalousieTemperatureTab

    property alias currentSliderValue: temperatureSlider.firstTemperature
    property alias currentSliderActualValue: temperatureSlider.actualTemperature
    property real currentTemperatureValue

    signal checkStateTriggered()

    /**
    * A custom slider for temperature settings.
    * (\see TempSlider)
    */
    TemperatureSlider {
        id: temperatureSlider
        anchors.centerIn: parent
        actualTemperature: currentTemperatureValue
        onFirstTemperatureChanged: checkStateTriggered()
    }
}
