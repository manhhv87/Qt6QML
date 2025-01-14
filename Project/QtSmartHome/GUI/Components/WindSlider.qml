import QtQuick 2.15

/*
* The Windslider customizes the ActualValueSlider
* Mainly it sets the type to "Wind" and adds fancy ballon texts.
*/
ActualValueSlider {
    //type: "wind"
    actualValue: 11

    width: 520
    valueSliderHeight: 120
    backgroundImage: "qrc:/Images/wind/wind_scale.png"

    /**
     * style the balloon
     */
    balloonHeight: 56
    balloonTriangleHeight: 20
    balloonImage: "qrc:/Images/wind/balloon/balloon_minsize.svg"
    balloonTriangleImage: "qrc:/Images/wind/balloon/balloon_triangle.svg"

    /**
     * style the knob
     */
    knobImagePressed: "qrc:/Images/fader/button_pressed.svg"
    knobImageNormal: "qrc:/Images/fader/button_normal.svg"

    /**
     * style the needle
     */
    needleImage: "qrc:/Images/wind/needle.svg"

    /**
     * style the focus
     */
    focusVisible: false
    focusImage: ""

    value: 40
    balloonText: "strong breeze"
    minValue: 0
    maxValue: 60

    // Every value change will change the ballontext
    onValueChanged: {
        if(value < 10)
            balloonText = "calm"
        else if(value <= 20)
            balloonText = "gentle breeze"
        else if(value <= 30)
            balloonText = "breeze"
        else if(value <= 40)
            balloonText = "strong breeze"
        else if(value <= 50)
            balloonText = "stormy wind"
        else
            balloonText = "hurricane"
    }
}
