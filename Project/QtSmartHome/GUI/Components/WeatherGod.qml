import QtQuick 2.15

/**
* Why doing a rain dance or pray for sun.
* Just use the WeatherGod Item to adjust the weater.
* A slider is used to adjust the weather.
* Warning it changes the weather just for this app. Sorry.
* TODO: Connect to Petrus or other weather entities as you like.
* There was no intention to discriminate any religion.
*/
Item {
    id: god

    property real newWeatherCondition: conditionSlider.value || 0
    property variant weatherStates: ["sunny", "cloudy", "rainy", "stormy", "thunder", "snow"]

    SHText {
        id: lord
        x: conditionSlider.x
        text: "CHOOSE YOUR WEATHER"
        font.pointSize: 20
    }

    /**
    * This image shows the state of the weather as text
    */
    Image {
        id: balloon

        property string text: weatherStates[Math.round(newWeatherCondition)]

        anchors {
            top: lord.bottom
            horizontalCenter: god.horizontalCenter
            topMargin: 50
        }
        source: "qrc:/Images/weathergod/preset.svg"

        SHText {
            anchors.centerIn: parent
            font.pointSize: 14
            color: "black"
            text: balloon.text
        }
    }

    /**
    * Draws the fancy weather icons upon the rest
    */
    Image {
        id: iconsline
        z: conditionSlider.z + 1
        anchors {
            top: balloon.bottom
            horizontalCenter: god.horizontalCenter
            topMargin: 40
        }
        source: "qrc:/Images/weathergod/icons_line.png"
    }

    /**
    * An ActualValueSlider is used to adjust the weather. (\see ActualValueSlider)
    */
    ActualValueSlider {
        id: conditionSlider

        anchors.top: iconsline.bottom
        anchors.horizontalCenter: god.horizontalCenter
        anchors.topMargin: -98

        width: 660
        valueSliderHeight: 54
        backgroundImage: "qrc:/Images/weathergod/weathergod_scale.png"

        /**
         * styling the balloon
         */
        balloonHeight: 56
        balloonTriangleHeight: 20
        balloonImage: "qrc:/Images/weathergod/balloon/balloon_minsize.svg"
        balloonTriangleImage: "qrc:/Images/weathergod/balloon/balloon_triangle.svg"

        /**
         * styling the knob
         */
        knobImagePressed: "qrc:/Images/fader/button_pressed.svg"
        knobImageNormal: "qrc:/Images/fader/button_normal.svg"

        /**
         * styling the needle
         */
        needleImage: "qrc:/Images/weathergod/needle.svg"
        needleVisible: false

        /**
         * styling the focus
         */
        focusVisible: true
        focusImage: "qrc:/Images/weathergod/focus.svg"

        minValue: 0
        maxValue: 5
        snapToValue: true
    }
}
