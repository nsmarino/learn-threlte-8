<script>
  import { Canvas } from '@threlte/core'
  import Scene from './Scene.svelte'
  import ShaderScene from './ShaderScene.svelte';
</script>

<section class="absolute z-20 flex justify-center w-full h-screen items-center pointer-events-none">
    <h1 class="text-[200px] text-white" style="font-family:Arial, Helvetica, sans-serif;">ZERO</h1>
</section>

<section class="w-full h-screen">
  <Canvas>
    <ShaderScene />
  </Canvas>
</section>

<style>
  :global(body), :global(html) {
    margin: 0;
    padding: 0;
    overflow: hidden;
  }
</style>
