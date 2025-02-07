<script>
  import { Canvas } from '@threlte/core'
  import Scene from './Scene.svelte'
  import ShaderScene from './ShaderScene.svelte';
  import ShaderFlexScene from './ShaderFlexScene.svelte';

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
  </Canvas>
</section>

<nav class="absolute bottom-0 w-full flex justify-around bg-gray-800 p-4">
  <button onclick={() => currentScene ='ShaderScene'} class="text-white">ShaderScene</button>
  <button onclick={() => currentScene = 'Scene'} class="text-white">Scene</button>
  <button onclick={() => currentScene = 'ShaderFlexScene'} class="text-white">ShaderFlexScene</button>
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
