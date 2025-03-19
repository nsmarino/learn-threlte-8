<script>
    import { Canvas } from '@threlte/core'
    import ShaderScene from '$lib/components/ShaderScene.svelte';
    import Sidebar from '$lib/components/Sidebar.svelte';
    let currentScene = $state('ShaderScene');
  </script>
  
<Sidebar 
    heading="Shader Backgrounds"
    description="Creating shaders with Three.js."
/>

<section class="w-full h-screen">
    <Canvas>
        <ShaderScene />
    </Canvas>
</section>


