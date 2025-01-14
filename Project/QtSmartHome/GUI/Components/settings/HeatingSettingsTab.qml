import QtQuick 2.15

import "../"

/**
 * This is the tab for showing the heating settings
 * It is used in the Settings Elements.
 */
TabPage {
    id: heatingSettingsTab

    property alias firstTemperature: temperatureSlider.firstTemperature
    property alias secondTemperature: temperatureSlider.secondTemperature
    property alias actualTemperature: temperatureSlider.actualTemperature

    signal checkStateTriggered()

    /**
    * A custom slider for temperature settings.
    * (\see TempSlider)
    */
    TemperatureSlider {
        id: temperatureSlider
        anchors.centerIn: parent
        secondHandleVisible: true
        secondHandleIconSource: "qrc:/SmartHome/Images/weather/moon.png"
        handleIconSource: "qrc:/SmartHome/Images/weather/sun.png"
        onFirstTemperatureChanged: checkStateTriggered()
        onSecondTemperatureChanged: checkStateTriggered()

    }
}
