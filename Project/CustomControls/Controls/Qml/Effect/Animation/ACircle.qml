import QtQuick 2.9

ShaderEffect {
    id: r
    readonly property int directFromInner: 0
    readonly property int directFromOuter: 1
    property int dir :directFromInner
    property int duration: 1000
    property ShaderEffectSource effectSource: ShaderEffectSource {
        hideSource: true
    }
    property int percent
    opacity: percent > 0 ? 1 : 0

    NumberAnimation {
        id: animation
        target: r
        property: "percent"
        from: 0
        to: 100
        alwaysRunToEnd: true
        loops: 1
        duration: r.duration
    }

    fragmentShader: CusEffectCommon.fragmentShaderCommon + (dir === directFromInner ? "
        varying vec2 qt_TexCoord0;
        uniform float qt_Opacity;
        uniform sampler2D effectSource;
        uniform int dir;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);
            float p = float(percent) / 100.0;
            float dis = distance(qt_TexCoord0, vec2(0.5, 0.5));
            float antialiseRadius = 0.01;
            float alpha = 1.0 - smoothstep(p, p + antialiseRadius,  dis);
            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
       }
" : "
        varying vec2 qt_TexCoord0;
        uniform float qt_Opacity;
        uniform sampler2D effectSource;
        uniform int dir;
        uniform int percent;

        void main()
        {
            vec4 color = texture2D(effectSource, qt_TexCoord0);
            float p = float(percent) / 100.0;
            float dis = distance(qt_TexCoord0, vec2(0.5, 0.5));
            float antialiseRadius = 0.01;
            float alpha = smoothstep(1.0 - p ,1.0 - p + antialiseRadius, dis);
            alpha *= qt_Opacity;
            gl_FragColor = vec4(color.rgb * alpha, alpha);
        }
")

    function restart() {
        animation.restart()
    }
}
