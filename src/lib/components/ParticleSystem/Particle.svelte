<script lang="ts">
  import { T } from '@threlte/core'
  import { Collider, RigidBody, type ContactEvent } from '@threlte/rapier'
  import type { Euler, Vector3 } from 'three'
  import { BoxGeometry, MeshStandardMaterial } from 'three'
  const geometry = new BoxGeometry(1, 1, 1)
  const material = new MeshStandardMaterial()


  export let position: Vector3 | undefined = undefined
  export let rotation: Euler | undefined = undefined


  $: rotationCasted = rotation?.toArray() as [x: number, y: number, z: number]
</script>

<T.Group
  position.x={position?.x}
  position.y={position?.y}
  position.z={position?.z}
  rotation={rotationCasted}
>
  <RigidBody
    type={'dynamic'}
  >

    <Collider
      contactForceEventThreshold={30}
      restitution={0.4}
      shape={'cuboid'}
      args={[0.5, 0.5, 0.5]}
    />
    <T.Mesh
      castShadow
      receiveShadow
      {geometry}
      {material}
    />
  </RigidBody>
</T.Group>
