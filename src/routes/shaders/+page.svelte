<script>
    import { Canvas } from '@threlte/core'
    import ShaderScene from '$lib/components/ShaderScene.svelte';
    
    let currentScene = $state('ShaderScene');
  </script>
  
  <section class="px-8 py-16 absolute z-20 w-1/3 h-screen overflow-scroll bg-black">
    <h1 class="h5 uppercase mb-8">⛰ Fullscreen Shader Background</h1>  
    <p class="mb-4">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s. When an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
    <p><a href="/" class="w-10 h-10 block rounded-full bg-white flex items-center justify-center back-btn"><span>🔙</span></a></p>
</section>

<style>
.back-btn:hover span {
    transform: scale(1.25);
    transition: transform 0.2s cubic-bezier(0.075, 0.82, 0.165, 1);
}
.back-btn span {
    transform: scale(1);
    transition: transform 0.2s cubic-bezier(0.075, 0.82, 0.165, 1);
}
</style>
<section class="w-full h-screen">
    <Canvas>
        <ShaderScene />
    </Canvas>
</section>


