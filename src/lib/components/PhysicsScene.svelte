<script lang="ts">
    import { T, useTask } from '@threlte/core'
    import { interactivity } from '@threlte/extras'
    import { World } from '@threlte/rapier'
    import { AutoColliders } from '@threlte/rapier'
    import Emitter from './ParticleSystem/Emitter.svelte'

</script>
<World>
    <T.PerspectiveCamera
    makeDefault
    position={[10, 10, 10]}
    oncreate={(ref) => {
        ref.lookAt(0, 0, 0)
    }}
    />

    <T.DirectionalLight 
        position={[0, 10, 10]}
        castShadow
    />

    <Emitter />
    <!-- Ground! -->
    <T.Group position={[0, -0.5, 0]}>
        <AutoColliders shape={'cuboid'}>
          <T.Mesh receiveShadow>
            <T.BoxGeometry args={[10, 1, 10]} />
            <T.MeshStandardMaterial />
          </T.Mesh>
        </AutoColliders>
      </T.Group>


    {#snippet fallback()}
      <div>
        <h1>Fallback</h1>
      </div>
    {/snippet}
</World>
