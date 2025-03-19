// terrainFragmentShader.glsl
varying vec2 vUv;
uniform float time;

// Get the height value from the vertex shader
varying float vHeight;

void main() {
    // Normalize height to range [0,1] (adjust as needed)
    float height = clamp(vHeight * 0.5 + 0.5, 0.0, 1.0);

    // Define terrain colors
    vec3 lowColor = vec3(0.1, 0.3, 0.1);  // Dark green (grass)
    vec3 midColor = vec3(0.5, 0.4, 0.3);  // Brown (dirt)
    vec3 highColor = vec3(1.0, 1.0, 1.0); // White (snow)

    // Blend colors based on height
    vec3 color = mix(lowColor, midColor, smoothstep(0.2, 0.6, height));
    color = mix(color, highColor, smoothstep(0.6, 1.0, height));

    gl_FragColor = vec4(color, 1.0);
}
