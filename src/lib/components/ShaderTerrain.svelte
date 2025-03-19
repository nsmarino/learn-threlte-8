<script>
    import { T } from '@threlte/core';
    import { PlaneGeometry } from 'three';
    import { onMount, onDestroy } from 'svelte';
    import vertexShader from '../shaders/terrain/vertex.glsl?raw'
    import fragmentShader from '../shaders/terrain/fragment.glsl?raw'

    const terrainSize = 40;
    const geometry = new PlaneGeometry(terrainSize, terrainSize, 100,100);
    
    let uniforms = {
        time: { value: 0 }
    };
    let frameId;
    let frameSkip = 0;

    // function animate() {
    //     console.log("animate??")
    //     if (frameSkip % 30 === 0) { // Only update every 2nd frame
    //         uniforms.time.value += 0.015; // Slightly faster movement
    //         console.log("updating time")
    //     }
    //     frameSkip++;
    //     requestAnimationFrame(animate);
    //     frameId = requestAnimationFrame(animate);
    // }
    function animate() {
        if (frameSkip % 2 === 0) { // Only update every 2nd frame
            uniforms.time.value += .1; // Slightly faster movement
        }
        frameSkip++; 
        frameId = requestAnimationFrame(animate);
    }

    onMount(() => {
        console.log("onMount")
        animate();
    });

    onDestroy(() => {
        cancelAnimationFrame(frameId);
    });

</script>
<T.PerspectiveCamera
    makeDefault
    position={[0, 15, 40]} 
    fov={20}
    oncreate={(ref) => {
        ref.lookAt(0, 2, 0);
    }}
/>

<T.Mesh {geometry} rotation.x={-Math.PI / 2}>
    <T.ShaderMaterial 
        {vertexShader} 
        {fragmentShader} 
        uniforms={uniforms} 
    />
</T.Mesh>