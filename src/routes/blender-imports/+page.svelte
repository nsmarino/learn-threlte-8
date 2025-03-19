<script>
  import Sidebar from "$lib/components/Sidebar.svelte";
  import { Canvas } from '@threlte/core';
  import BlenderImportScene from "$lib/components/BlenderImportScene.svelte";
</script>
<Sidebar
    heading="Blender Imports"
    description="Importing models from Blender as GLTFs."
>
</Sidebar>

<section class="w-full h-screen">
    <Canvas>
        <BlenderImportScene />
    </Canvas>
</section>


