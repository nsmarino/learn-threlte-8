<script>
    import { T, useTask, } from '@threlte/core'
    import { interactivity, OrbitControls } from '@threlte/extras'
    import { Spring } from 'svelte/motion'
    import House from './GLTF/House.svelte';
    

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
  position={[20, 20, 20]}
  oncreate={(ref) => {
    ref.lookAt(0, 1, 0)
  }}>
  <OrbitControls autoRotate={true} />
</T.PerspectiveCamera>

<T.AmbientLight 

    intensity={2}
/>

<House />

