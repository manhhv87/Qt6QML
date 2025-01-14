import QtQuick 2.15
import "Components"

Item {
    id: smartHome
    width: 800
    height: 480
    smooth: false

    property int parentOpacity: (parent == null) ? 1 : parent.opacity

    property int currentWeather: 0
    property int titlebarHeight: 50
    property int spacing: 10

    /**    This Element defines the main screen area which is visible most of the time.
    */
    MainScreen {
        id: mainScreen
        width: parent.width
        height: parent.height
        xSpacing: smartHome.spacing
        ySpacing: smartHome.titlebarHeight + smartHome.spacing

        animationsHalted: (smartHome.parentOpacity == 0)

        // we need to round because WeatherGodView also does
        weather: Math.round(currentWeather.weatherCondition)
        forecastWind: currentWeather.oneDayWindForce
        forecastRainProp: currentWeather.oneDayRainPropability
        forecastRain: currentWeather.oneDayRain
        rain: currentWeather.currentRain
        wind: currentWeather.currentWindForce
        temperature: currentWeather.currentTemperature
        temperatureHigh: currentWeather.currentHighTemperature
        temperatureLow: currentWeather.currentLowTemperature
        hour: currentWeather.hour
        minute: currentWeather.minute
        lux: currentWeather.currentLux

        Titlebar {
            id: titlebar

            width: parent.width
            height: titlebarHeight
            anchors.top: parent.top
            titleBarText: "Smart Home Control"
            dateAndTime: currentWeather.currentDateAndTime
            titleHomeButton.visible: mainScreen.menuIsCovered

            onGodModeChanged: godMode ? smartHome.state = "weathergod" : smartHome.state = ""
            onHomePressed: {
                smartHome.state = ""
                mainScreen.home()
            }
        }
    }

    /**
    Here is the Screen displaying the "Weather God". It consists of an QML Image
    element (the background image) and the custom "WeatherGod" (see components/weatherGod.qml)
    Element
    */
    WeatherGodScreen {
        id: weatherGodScreen
        width: parent.width
        height: parent.height - titlebarHeight
        anchors.bottom: mainScreen.top
        onNewWeatherConditionChanged: currentWeather.weatherCondition = newWeatherCondition
    }

    WeatherItem {
        id: currentWeather
        onCheckState: mainScreen.checkState();
    }

    /*
    The main screen has two states.
    - the default state
    - the "weathergod" state
    Animated state switching is done using QML transistions.
    */
    states: [
        State {
            name: "weathergod"
            PropertyChanges {
                target: mainScreen
                y: smartHome.height - titlebarHeight
            }
            PropertyChanges {
                target: titlebar
                titleBarText: "Weather God Control"
            }
        }
    ]
    /*
    Here the transitions are defined. A simple NumberAnimation is used to animate the "y" property
    of the mainScreen.
    */
    transitions: [
        Transition {
            from: "*"
            to: "weathergod"
            NumberAnimation {
                properties: "y"
                duration: 1000
                easing.type: Easing.OutBounce
            }

        },
        Transition {
            from: "weathergod"
            to: "*"
            NumberAnimation {
                properties: "y"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }
    ]
}
