import QtQuick 2.15

/**
* This item shows information about the forecast
*/

Item {
    id: foreCast

    property real wind: 5 // just some defaults
    property real rainProp: 10 // just some defaults
    property real rain: 10 // just some defaults

    // when the wind changes the desription will be adjusted
    onWindChanged: {
        var desc = ["still", "calm", "gentle breeze", "steady breeze", "stiff breeze", "windy"
                , "strong wind", "stormy", "hurricane"]
        var index = Math.floor( (wind / 12) * 9 )
        windDescription.text = desc[index]
    }

    // when the rain propability changes a corresponding image and
    // the correct probability of rain will be shown
    onRainPropChanged: {
        if( rainProp < 30 )
            rainPropability.source = "qrc:/Images/icons/possibility_of_rain_low.png"
        else
            rainPropability.source = "qrc:/Images/icons/possibility_of_rain_high.png"
        rainPropabilityText.text = Math.floor(rainProp) + "%"
    }
    // when the rain changes we show the amount as text
    onRainChanged: {
        rainAmountText.text = Math.floor(rain) + " ml/m²"
    }

    /**
    * All forecast informations are aligned in a grid.
    * 2 Columns are preset.
    */
    Grid {
        id: grid
        columns: 2
        spacing: 10
        /**
        * Image instance to show storm_force icon
        */
        Image {
            id: storm
            source: "qrc:/Images/icons/storm_force.png"
        }
        /**
        * SHText instance to show wind description
        */
        SHText {
            id: windDescription
            font.pointSize: 21
            height: storm.height
        }
        /**
        * Image instance to show rain propability icon
        */
        Image {
            id: rainPropability
            source: "qrc:/Images/icons/possibility_of_rain_low.png"
        }
        /**
        * SHText instance to show rain propability text
        */
        SHText {
            id: rainPropabilityText
            font.pointSize: 21
            height: rainPropability.height
        }
        /**
        * Image instance to show quantity of rain icon
        */
        Image {
            id: rainAmount
            source: "qrc:/Images/icons/quantity_of_rain.png"
        }
        /**
        * SHText instance to show quantity of rain text
        */
        SHText {
            id: rainAmountText
            font.pointSize: 21
            height: rainAmount.height
        }
    }

    /**
    * A Column positioner is used here.
    */
    Column {
        x: 10
        y: 55
        spacing: 65
        /**
        * A simple white rectangle with a border is drawn
        * This is used as a seperator line
        */
        Rectangle {
            width: foreCast.width - 15
            height: 4; radius: 2
            color: "white"
            border {color: "lightGray"; width: 1}
        }
        Rectangle {
            width: foreCast.width - 15
            height: 4; radius: 2
            color: "white"
            border {color: "lightGray"; width: 1}
        }
    }
}
