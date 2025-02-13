<script>
    import { useGltf, useGltfAnimations } from '@threlte/extras'
    import { T } from '@threlte/core'

    const gltf = useGltf('/gltf/test-anim.gltf')
    
    export const { actions, mixer } = useGltfAnimations(gltf)

    const cubeAction = $derived($actions['CubeAction'])

    $effect(() => {
        cubeAction?.play()
    })

  
  </script>
{#await gltf then { scene }}
    <T is={scene} />
{/await}

  