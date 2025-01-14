import QtQuick 2.15

import "../tabwidget"

/**
* This Item shows all settings for the blind
* Mainly it contains a tabwidget (/see TabWidget)
* that contains separate settings for temperature, time and wind
*/

SettingsItem {
    id: base

    property int itemIndex: 0

    /**
    * This function controls the logics.
    * This function will be called by every value change.
    * It checks the conditions to drive the blind up and down
    */
    function checkState() {

        var temperatureTooHigh = jalousieTemperatureTab.currentSliderActualValue > jalousieTemperatureTab.currentSliderValue
        var windTooStrong = jalousieWindTab.currentSliderActualValue > jalousieWindTab.currentSliderValue

        var startHour = timePickerId.currentStartTime1
        var startMinute = timePickerId.currentStartTime2
        var endHour = timePickerId.currentEndTime1
        var endMinute = timePickerId.currentEndTime2

        var cTime = currentHour * 100 + currentMinute

        var sTime = Math.floor(startHour * 100) + Math.floor(startMinute)
        var eTime = Math.floor(endHour * 100) + Math.floor(endMinute)

        var toggle = false
        if( sTime > eTime ) {
            toggle = true
            var help = sTime
            sTime = eTime
            eTime = help
        }

        var timeOn = (cTime >= sTime) && (cTime <= eTime)
        if( toggle ) {
            timeOn = !timeOn
        }

        // if wind too strong go up
        // if temp too high go down
        // if current time is between start and end time, go down.
        // on is down
        hardwareModels.blindModel.setProperty( base.itemIndex, "on", !windTooStrong && (temperatureTooHigh|| timeOn))
    }

    // is called when the itemindex is changed
    onItemIndexChanged: tabWidget.updateValues()

    Item {
        anchors.fill: parent
        id: contents

        /**
        * The TabWidget (\see TabWidget) is a custom item for a tabwidget like behaviour
        * It contains multiple items that can be accesed by clicking the tabs.
        */
        TabWidget
        {
            id: tabWidget

            /**
            * This function updates the items with the model values
            */
            function updateValues() {
                var startHour = hardwareModels.blindModel.get(itemIndex).startTimeHours
                var startMinute = hardwareModels.blindModel.get(itemIndex).startTimeMinutes
                var endHour = hardwareModels.blindModel.get(itemIndex).endTimeHours
                var endMinute = hardwareModels.blindModel.get(itemIndex).endTimeMinutes
                timePickerId.setStartTime(startHour,startMinute)
                timePickerId.setEndTime(endHour,endMinute)

                var ct  = hardwareModels.blindModel.get(itemIndex).closeTemp
                jalousieTemperatureTab.currentSliderValue = ct

                var cw  = hardwareModels.blindModel.get(itemIndex).closeWind
                jalousieWindTab.currentSliderValue = cw / 12 * 60

                var awc  = hardwareModels.blindModel.get(itemIndex).automaticWindClose
            }

            color: "transparent"
            width: parent.width
            height: parent.height
            anchors {
                leftMargin: 2
                rightMargin: 2
                topMargin: 10
                bottomMargin: 10
            }

            state: "init"
            // all pages of the tabwidget are declared here
            pages: [
                TimePickerTab {
                    id: timePickerId
                    tabIndex: 0
                    tabIconPath: "qrc:/SmartHome/Images/icons/time.png"
                    tabText: "Time"
                    tabAlignment: tabWidget.alignRight
                    anchors.fill: parent
                    titleText: "Settings: Jalousie"
                    description: "Jalousie closes automatically between"
                    explanationText1: ""
                    explanationText2: ""
                    iconSource: hardwareModels.blindModel.get(base.itemIndex).on ?
                                    "qrc:/SmartHome/Images/icons/svg_icons/jalousie_down.svg" : "qrc:/SmartHome/Images/icons/svg_icons/jalousie_up.svg"
                    onCheckStateTriggered: base.checkState()
                },
                JalousieWindTab {
                    id: jalousieWindTab
                    tabIndex: 1
                    tabIconPath: "qrc:/SmartHome/Images/icons/storm_force.png"
                    tabText: "Wind"
                    tabAlignment: tabWidget.alignRight
                    anchors.fill: parent
                    titleText: "Settings: Jalousie"
                    description: "Jalousie opens automatically if wind force is higher then"
                    explanationText1: ""
                    explanationText2: ""
                    iconSource: hardwareModels.blindModel.get(base.itemIndex).on ?
                                    "qrc:/SmartHome/Images/icons/svg_icons/jalousie_down.svg" : "qrc:/SmartHome/Images/icons/svg_icons/jalousie_up.svg"
                    onCheckStateTriggered: base.checkState()
                    currentWindForceValue: currentWindForce
                },
                JalousieTemperatureTab {
                    id: jalousieTemperatureTab
                    tabIndex: 2
                    tabIconPath: "qrc:/SmartHome/Images/icons/temperature_high.png"
                    tabText: "Temp"
                    tabAlignment: tabWidget.alignRight
                    anchors.fill: parent
                    titleText: "Settings: Jalousie"
                    description: ""
                    iconSource: hardwareModels.blindModel.get(base.itemIndex).on ?
                                    "qrc:/SmartHome/Images/icons/svg_icons/jalousie_down.svg" : "qrc:/SmartHome/Images/icons/svg_icons/jalousie_up.svg"
                    explanationText1: "Jalousie closes automatically"
                    explanationText2: "if temperature is higher than"
                    currentTemperatureValue: currentTemperature
                    onCheckStateTriggered: base.checkState()
                }
            ]
            // There are just a init state, that will be called at the beginning once.
            // For initialisation purpose.
            // Definitely could be done differently.
            states: [
                State {
                    name: "init"
                    StateChangeScript {
                        script: tabWidget.updateValues()
                    }
                }
            ]
        }
    }
}
