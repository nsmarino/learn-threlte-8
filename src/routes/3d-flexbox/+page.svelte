<script>
    import Sidebar from "$lib/components/Sidebar.svelte";
    import { Canvas } from '@threlte/core';
    import FlexScene from "$lib/components/FlexScene.svelte";
  
  </script>
  <Sidebar
      heading="3D Flexbox"
      description="Aligning 3D objects in a responsive flexbox-like manner."
  >
  </Sidebar>
  
  <section class="w-full h-screen">
    <Canvas>
        <FlexScene />
    </Canvas>
  </section>
  
