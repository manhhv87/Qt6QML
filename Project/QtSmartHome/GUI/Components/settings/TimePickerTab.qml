import QtQuick 2.15
import "qrc:/SmartHome/Qml/timepicker"

/**
 * This is the tab for showing the timer settings
 * It is used in the Settings Elements.
 */

TabPage {
    id: timePickerTab

    property variant currentStartTime1: startTime.currentValue1
    property variant currentStartTime2: startTime.currentValue2
    property variant currentEndTime1: endTime.currentValue1
    property variant currentEndTime2: endTime.currentValue2

    signal checkStateTriggered()

    function setStartTime(value1, value2)
    {
        startTime.setCurrentValues(value1, value2)
    }

    function setEndTime(value1, value2)
    {
        endTime.setCurrentValues(value1, value2)
    }

    /**
    * A custom item for timer settings.
    * (\see TimePicker)
    * Selection for the Start time here.
    */
    TimePicker {
        id: startTime
        caption: "Start time"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -140
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 50
        onValueChanged: checkStateTriggered()
    }

    /**
    * A custom item for timer settings.
    * (\see TimePicker)
    * Selection for the end time here.
    */
    TimePicker {
        id: endTime
        caption: "End time"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 110
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 50
        onValueChanged: checkStateTriggered()
    }
}
