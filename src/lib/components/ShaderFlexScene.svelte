<script lang="ts">
    import { T, useTask } from '@threlte/core'
    import { Flex, Box } from '@threlte/flex'

    console.log("llife goes on")
    let width=0,height=0

    let rotation = 0
    useTask(delta=> {
        rotation+=delta
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
    height={300}
    flexWrap="Wrap"
    alignItems="Center"
    justifyContent="SpaceBetween"
  >
  {#each { length: 2 } as _,i}
    <Box 
        width={width/3} 
        height={height/3}
        alignItems="Center"
        justifyContent="Center"
        >
        <T.Mesh 
            renderOrder={1}
        >
            <T.BoxGeometry args={[width/8,width/8,width/8]} />
            <T.MeshBasicMaterial color="hotpink" />
        </T.Mesh>
    </Box>
    {/each}
</Flex>