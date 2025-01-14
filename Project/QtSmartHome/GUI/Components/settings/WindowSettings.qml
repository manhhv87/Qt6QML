import QtQuick 2.15

import "../tabwidget"


/**
* This Item shows all settings for the windows
* Mainly it contains a tabwidget (/see TabWidget)
* that contains separate settings for rain and wind
*/
SettingsItem {
    id: base

    property int itemIndex: 0

    property alias currentWindValue: windowWindTab.currentSliderValue
    property alias currentRainValue: windowRainTab.currentSliderValue

    /**
    * This function controls the logics.
    * This function will be called by every value change.
    * It checks the conditions to close/open the window
    */
    function checkState() {
        var tooMuchRain = windowRainTab.currentSliderActualValue > windowRainTab.currentSliderValue
        var tooMuchWind = windowWindTab.currentSliderActualValue > windowWindTab.currentSliderValue

        // if currentRain is higher than rainsetting -> close window
        // if wind force is stronger than wind setting -> close window
        // on is open
        hardwareModels.windowModel.setProperty( base.itemIndex, "on", !tooMuchRain && !tooMuchWind)
    }
    onCurrentWindValueChanged: {
        checkState()
    }
    onCurrentRainValueChanged: {
        checkState()
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
                var cw  = hardwareModels.windowModel.get(itemIndex).closeWind
                windowWindTab.currentSliderValue = cw / 12 * 60

                var cr  = hardwareModels.windowModel.get(itemIndex).closeRain
                windowRainTab.currentSliderValue = cr
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
                WindowRainTab {
                    id: windowRainTab
                    tabIndex: 0
                    tabIconPath: "qrc:/SmartHome/Images/icons/rain.png"
                    tabText: "Rain"
                    tabAlignment: tabWidget.alignRight
                    anchors.fill: parent
                    titleText: "Settings: Windows"
                    description: "Windows close automatically if it rains more than"
                    explanationText1: ""
                    explanationText2: ""
                    iconSource: hardwareModels.windowModel.get(base.itemIndex).on ?
                                    "qrc:/SmartHome/Images/icons/svg_icons/window_open.svg" : "qrc:/SmartHome/Images/icons/svg_icons/window_close.svg"
                    currentRainValue: currentRain
                },
                WindowWindTab {
                    id: windowWindTab
                    tabIndex: 1
                    tabIconPath: "qrc:/SmartHome/Images/icons/storm_force.png"
                    tabText: "Wind"
                    tabAlignment: tabWidget.alignRight
                    anchors.fill: parent
                    titleText: "Settings: Windows"
                    description: "Windows close automatically if wind force is higher than"
                    explanationText1: ""
                    explanationText2: ""
                    iconSource: hardwareModels.windowModel.get(base.itemIndex).on ?
                                    "qrc:/SmartHome/Images/icons/svg_icons/window_open.svg" : "qrc:/SmartHome/Images/icons/svg_icons/window_close.svg"
                    currentWindForceValue: currentWindForce
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
