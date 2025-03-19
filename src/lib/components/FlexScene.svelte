<script lang="ts">
    import { T, useTask } from '@threlte/core'
    import { Flex, Box } from '@threlte/flex'

    console.log("llife goes on")
    let width=0,height=0

    let rotation = 0
    useTask(delta=> {
        rotation+=delta/100
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
<T.DirectionalLight />

  <Flex
    {width}
    {height}
    flexWrap="Wrap"
  >
  {#each { length: 9 } as _,i}
  <Box width={width/3} height={height/3}>
    <T.Mesh 
        renderOrder={1}
        rotation.y={rotation*(i+1)}
        rotation.z={rotation*(i+1)}
    >
        <T.BoxGeometry args={[width/8,width/8,width/8]} />
        <T.MeshBasicMaterial color="hotpink" />
    </T.Mesh>
</Box>{/each}

  </Flex>