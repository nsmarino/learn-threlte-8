<script>
    import Sidebar from "$lib/components/Sidebar.svelte";
    import { Canvas } from '@threlte/core';
    import ShaderTerrain from "$lib/components/ShaderTerrain.svelte";
  
  </script>
  <Sidebar
      heading="Terrain"
      description="Using shaders to create heightmap-based terrain."
  >
  </Sidebar>
  
  <section class="w-full h-screen">
    <Canvas>
        <ShaderTerrain />
    </Canvas>
  </section>
  