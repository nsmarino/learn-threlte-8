<script>
    import { useGltf } from '@threlte/extras'
    import { T } from '@threlte/core'

    const gltf = useGltf('/gltf/NightbloomHouse.gltf')
    
</script>

{#await gltf then { scene }}
    <T is={scene} />
{/await}

  