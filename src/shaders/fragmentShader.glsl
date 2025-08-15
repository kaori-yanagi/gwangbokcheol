//記述なし
// precision mediump float;
uniform vec3 uColor;//r, g, b
uniform sampler2D uTexture;

//はた貼り付ける　vertexShader.glsl
varying vec2 vUv;
varying float vElevation;

void main() {
    // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
   vec4 textureColor = texture2D(uTexture, vUv);
    // gl_FragColor = vec4(uColor, 1.0);
    textureColor.rgb *= vElevation * 2.6 + 0.7;
    gl_FragColor = textureColor;
}