<script>
  import { Canvas } from '@threlte/core'
  import Scene from './Scene.svelte'
  import ShaderScene from './ShaderScene.svelte';
  import ShaderFlexScene from './ShaderFlexScene.svelte';
  import PhysicsScene from './PhysicsScene.svelte';

  let currentScene = $state('ShaderScene');
</script>

<section class="absolute z-20 flex justify-center w-full h-screen items-center pointer-events-none">
    <h1 class="text-[200px] text-white" style="font-family:Arial, Helvetica, sans-serif;">ZERO</h1>
</section>

<section class="w-full h-screen">
  <Canvas>
    {#if currentScene === 'ShaderScene'}
      <ShaderScene />
    {/if}
    {#if currentScene === 'Scene'}
      <Scene />
    {/if}
    {#if currentScene === 'ShaderFlexScene'}
      <ShaderFlexScene />
    {/if}
    {#if currentScene === 'PhysicsScene'}
      <PhysicsScene />
    {/if}
  </Canvas>
</section>

<nav class="absolute bottom-0 w-full flex justify-around bg-gray-800 p-4">
  <button onclick={() => currentScene ='ShaderScene'} class="text-white">Shader</button>
  <button onclick={() => currentScene = 'Scene'} class="text-white">GLTF Animation</button>
  <button onclick={() => currentScene = 'ShaderFlexScene'} class="text-white">3D Flexbox</button>
  <button onclick={() => currentScene = 'PhysicsScene'} class="text-white">Physics</button>
</nav>

<style>
  :global(body), :global(html) {
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #000;
  }
  nav button {
    background: none;
    border: none;
    cursor: pointer;
    font-size: 16px;
  }
  nav button:hover {
    text-decoration: underline;
  }
</style>
