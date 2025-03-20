<script lang="ts">
    import { T, useTask } from '@threlte/core'
    import { Flex, Box } from '@threlte/flex'
    import GLTFBox from './GLTF/Box.svelte'

    console.log("life goes on")
    let width=0,height=0

    let rotation = 0
    useTask(delta=> {
        rotation+=delta/50
    })
  </script>

<svelte:window bind:innerWidth={width} bind:innerHeight={height} />
<T.OrthographicCamera
    makeDefault
    near={44}
    far={4400}
    position={[0, 0, 3000]}
    oncreate={(ref) => ref.lookAt(0, 0, 0)}
    ></T.OrthographicCamera>
<T.DirectionalLight position={[10,10,10]} intensity={2} />
<T.DirectionalLight position={[-10,-10,10]} intensity={1} />

<Flex
    {width}
    {height}
    flexWrap="Wrap"
  >
  {#each { length: 9 } as _,i}

  <Box width={width/3} height={height/3}>
    <GLTFBox scale={width/16} rotation.y={rotation*(i+1)} rotation.z={rotation*(i+1)} />
  </Box>{/each}
</Flex>