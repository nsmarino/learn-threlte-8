// terrainVertexShader.glsl
varying vec2 vUv;
varying float vHeight;
uniform float time;

// Classic Perlin Noise function (hash-based)
vec2 hash(vec2 p) { return fract(sin(vec2(dot(p, vec2(127.1, 311.7)), dot(p, vec2(269.5, 183.3)))) * 43758.5453); }

float perlinNoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    
    vec2 u = f * f * (3.0 - 2.0 * f); // Smoothstep function
    
    return mix(mix(dot(hash(i + vec2(0.0, 0.0)), f - vec2(0.0, 0.0)),
                   dot(hash(i + vec2(1.0, 0.0)), f - vec2(1.0, 0.0)), u.x),
               mix(dot(hash(i + vec2(0.0, 1.0)), f - vec2(0.0, 1.0)),
                   dot(hash(i + vec2(1.0, 1.0)), f - vec2(1.0, 1.0)), u.x), u.y);
}

void main() {
    vUv = uv;

    vec3 newPosition = position;

    // Move noise sampling along the Y-axis for scrolling effect
    float noise = perlinNoise(position.xy * 0.2 + vec2(0.0, time * 0.5)) * 6.0; 

    newPosition.z += noise;

    vHeight = newPosition.z; // Pass height to fragment shader

    gl_Position = projectionMatrix * modelViewMatrix * vec4(newPosition, 1.0);
}
