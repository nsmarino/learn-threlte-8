<script>
    import { T, useTask } from '@threlte/core'
    import { interactivity } from '@threlte/extras'
    import { Spring } from 'svelte/motion'

    interactivity() // invoke to add interaction event listeners

    const scale = new Spring(1)
        // spring object with obj.current, obj.target, 
        // and obj.stiffness (rigidity, snappiness) / obj.damping (decay of motion over time)


    // threlte has a 'useTask' hook that taps into threlte's unified frame loop to run functions each frame
    let rotation = 0
    useTask(delta=> {
        rotation+=delta
    })

</script>

<T.PerspectiveCamera
  makeDefault
  position={[10, 10, 10]}
  oncreate={(ref) => {
    ref.lookAt(0, 1, 0)
  }}
/>

<T.DirectionalLight 
    position={[0, 10, 10]}
    castShadow
/>


<!-- Background -->
<T.Mesh
  rotation.x={-Math.PI / 2}
  receiveShadow
>
    <T.CircleGeometry
        args={[4,40]}
    />
    <T.MeshStandardMaterial
        color="white"
    />
</T.Mesh>

<!-- Foreground -->
<T.Mesh 
    position.y={1}
    rotation.y={rotation}
    scale={scale.current}
    onpointerenter={()=>{
        scale.target=1.5
    }}
    onpointerleave={() => {
        scale.target = 1
    }}
    castShadow
>
    <T.BoxGeometry args={[1, 2, 1]} />
    <T.MeshStandardMaterial color="hotpink" />
</T.Mesh>

