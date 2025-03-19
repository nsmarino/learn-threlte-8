<script>
    import { Canvas } from '@threlte/core'
    import ShaderScene from '$lib/components/ShaderScene.svelte';
    import Sidebar from '$lib/components/Sidebar.svelte';
    let currentScene = $state('ShaderScene');
  </script>
  
<Sidebar 
    heading="Fullsceen Shader"
    description="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."
/>

<section class="w-full h-screen">
    <Canvas>
        <ShaderScene />
    </Canvas>
</section>


