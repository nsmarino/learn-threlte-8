uniform mat4 modelViewMatrix; // Model-view matrix
uniform mat4 projectionMatrix; // Projection matrix
attribute vec3 position; // Vertex position

varying vec4 v_position;

void main() {
    v_position = vec4(position, 1.0);
    gl_Position = projectionMatrix * modelViewMatrix * v_position;
}