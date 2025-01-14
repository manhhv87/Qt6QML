import QtQuick 2.15

import "../"

/**
 * This is the tab for showing the wind settings
 * It is used in the Settings Elements.
 */
TabPage {
    id: jalousieWindTab

    property alias currentSliderValue: windSlider.value
    property alias currentSliderActualValue: windSlider.actualValue
    property real currentWindForceValue

    signal checkStateTriggered()

    /**
    * A custom item for wind settings.
    * (\see WindSlider)
    */
    WindSlider {
        id: windSlider
        anchors.centerIn: parent
        actualValue: currentWindForceValue / 12 * 60
        onValueChanged: checkStateTriggered()
    }

}
