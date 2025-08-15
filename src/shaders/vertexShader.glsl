// uniform float uFrequency;
uniform vec2 uFrequency;
uniform float uTime;


// 宣言用意記述なし
// uniform mat4 projectionMatrix;
// uniform mat4 viewMatrix;
// uniform mat4 modelMatrix;
// attribute vec3 position;

//型をきめる4ことができる
// float a = 1.0;
// float b = 2.0;
// float c = a + b;

varying vec2 vUv;
varying float vElevation;


void main() {

 vec4 modelPosition = modelMatrix * vec4(position, 1.0);

// modelPosition.x +=0.1;
//波として表現したいないサイン関数コサイン関数
// modelPosition.z += sin(modelPosition.x * uFrequency) * 0.1;
float elevation = sin(modelPosition.x * uFrequency.x + uTime) * 0.1;
// modelPosition.z += sin(modelPosition.x * uFrequency.x + uTime) * 0.1;

// modelPosition.z += sin(modelPosition.y * uFrequency.y + uTime) * 0.1;
elevation += sin(modelPosition.y * uFrequency.y + uTime) * 0.1;
modelPosition.z += elevation;
//旗の大きさトリミング
// modelPosition.y *= 0.6;

vec4 viewPosition = viewMatrix * modelPosition;
vec4 projectionPosition = projectionMatrix * viewPosition;
gl_Position = projectionPosition;
     // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);

vUv = uv;
vElevation = elevation;
}






// void main() {
//     gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
// }