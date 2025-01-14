import QtQuick 2.15

/**
* This Item defines all hardware models used in smarthome.
* Hardware means something as Lights, Heating, Blinds, Windows.
* The default values and icons for every hardware entity are defined here.
* In models you can define any property you need.
* This feature is used here alot.
* These models and its infos are used mainly in FanStack (/see FanStack)
* and in all settings in the components/settings folder.
*/

Item {
    property alias lightModel: light
    property alias heatingModel: heating
    property alias blindModel: blind
    property alias windowModel: window

    /**
    * A model for all lights in the house that can be controlled
    */
    ListModel {
        id: light

        ListElement {
            name: "Bedroom"
            iconOn: "qrc:/Images/icons/light_on.png"
            iconOff: "qrc:/Images/icons/light_off.png"
            on: true
            startTimeHours: 7
            endTimeHours: 19
            startTimeMinutes: 00
            endTimeMinutes: 45
            lowestLux: 6
        }

        ListElement {
            name: "Hall"
            iconOn: "qrc:/Images/icons/light_on.png"
            iconOff: "qrc:/Images/icons/light_off.png"
            on: false
            startTimeHours: 7
            endTimeHours: 19
            startTimeMinutes: 00
            endTimeMinutes: 45
            lowestLux: 7
        }

        ListElement {
            name: "Bathroom"
            iconOn: "qrc:/Images/icons/light_on.png"
            iconOff: "qrc:/Images/icons/light_off.png"
            on: false
            startTimeHours: 6
            endTimeHours: 18
            startTimeMinutes: 00
            endTimeMinutes: 45
            lowestLux: 4
        }
    }

    /**
    * A model for all heatings in the house that can be controlled
    */
    ListModel {
        id: heating

        ListElement {
            name: "Entrance"
            iconOn: "qrc:/Images/icons/radiator_on.png"
            iconOff: "qrc:/Images/icons/radiator_off.png"
            on: true
            startTimeHours: 20
            endTimeHours: 7
            startTimeMinutes: 00
            endTimeMinutes: 00
            dayTemp: 24
            nightTemp: 14
        }

        ListElement {
            name: "Hall"
            iconOn: "qrc:/Images/icons/radiator_on.png"
            iconOff: "qrc:/Images/icons/radiator_off.png"
            on: true
            startTimeHours: 19
            endTimeHours: 6
            startTimeMinutes: 00
            endTimeMinutes: 30
            dayTemp: 24
            nightTemp: 14
        }

        ListElement {
            name: "Kitchen"
            iconOn: "qrc:/Images/icons/radiator_on.png"
            iconOff: "qrc:/Images/icons/radiator_off.png"
            on: false
            startTimeHours: 19
            endTimeHours: 10
            startTimeMinutes: 00
            endTimeMinutes: 55
            dayTemp: 24
            nightTemp: 14
        }

        ListElement {
            name: "Kids"
            iconOn: "qrc:/Images/icons/radiator_on.png"
            iconOff: "qrc:/Images/icons/radiator_off.png"
            on: false
            startTimeHours: 19
            endTimeHours: 6
            startTimeMinutes: 00
            endTimeMinutes: 20
            dayTemp: 24
            nightTemp: 14
        }
    }

    /**
    * A model for all blinds in the house that can be controlled
    */
    ListModel {
        id: blind

        ListElement {
            name: "Kitchen"
            iconOn: "qrc:/Images/icons/jalousie_down.png"
            iconOff: "qrc:/Images/icons/jalousie_up.png"
            on: true
            startTimeHours: 19
            endTimeHours: 7
            startTimeMinutes: 00
            endTimeMinutes: 45
            closeTemp: 22
            closeWind: 7
            automaticWindClose: true
        }

        ListElement {
            name: "Bedroom"
            iconOn: "qrc:/Images/icons/jalousie_down.png"
            iconOff: "qrc:/Images/icons/jalousie_up.png"
            on: false
            startTimeHours: 21
            endTimeHours: 10
            startTimeMinutes: 00
            endTimeMinutes: 30
            closeTemp: 18
            closeWind: 6
            automaticWindClose: false
        }
    }

    /**
    * A model for all windows in the house that can be controlled
    */
    ListModel {
        id: window

        ListElement {
            name: "Kitchen"
            iconOn: "qrc:/Images/icons/window_open.png"
            iconOff: "qrc:/Images/icons/window_closed.png"
            on: false
            closeWind: 6
            closeRain: 32
        }

        ListElement {
            name: "Bedroom"
            iconOn: "qrc:/Images/icons/window_open.png"
            iconOff: "qrc:/Images/icons/window_closed.png"
            on: true
            closeWind: 7
            closeRain: 38
        }

        ListElement {
            name: "Library"
            iconOn: "qrc:/Images/icons/window_open.png"
            iconOff: "qrc:/Images/icons/window_closed.png"
            on: false
            closeWind: 6
            closeRain: 18
        }
    }
}
