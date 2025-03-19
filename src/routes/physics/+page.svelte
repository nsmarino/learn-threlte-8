<script lang="ts">
    import Sidebar from "$lib/components/Sidebar.svelte";
    import { Canvas } from '@threlte/core';
    import PhysicsScene from "$lib/components/PhysicsScene.svelte";

</script>
<Sidebar
    heading="Physics"
    description="Adding physics to your 3D models."
>
</Sidebar>

<section class="w-full h-screen">
    <Canvas>
        <PhysicsScene />
    </Canvas>
</section>


