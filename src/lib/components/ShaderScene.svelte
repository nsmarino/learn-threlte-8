<script>
    import Terrain from "./Terrain.svelte"
    import fragmentShader from '../shaders/fragment.glsl?raw'
    import vertexShader from '../shaders/vertex.glsl?raw'
    import * as THREE from 'three'
    import { ShaderMaterial, Vector3 } from 'three'
    import { T, useTask } from '@threlte/core'
    import { Tween } from 'svelte/motion'
    import { interactivity } from '@threlte/extras'
    import { quadOut } from 'svelte/easing'
    import { ThreeMFLoader } from "three/examples/jsm/Addons";

    // Interactivity and shader variables
    interactivity()

    const pulsePosition = new Vector3()

    const pulseTimer = new Tween(0, {
      easing: quadOut
    })
    const updatePulse = ({ point }) => {
      pulsePosition.copy(point)
      pulseTimer
        .set(0, {
          duration: 0
        })
        .then(() => {
          pulseTimer.set(1, { duration: 2000 })
        })
    }

    let rotation = 0
    useTask((delta) => {
      rotation+=delta
    })
</script>

  <T.PerspectiveCamera
    makeDefault
    position={[0,40,0]}
    fov={15}
    oncreate={(ref) => {
      ref.lookAt(0, 0, 0)
    }}
  >

  </T.PerspectiveCamera>

  <Terrain clickHandler={updatePulse}>
    <T.ShaderMaterial
    {fragmentShader}
    {vertexShader}
    uniforms={{
      pulseTimer: {
        value: 0
      },
      pulsePosition: {
        value: 0
      }
    }}
    uniforms.pulseTimer.value={pulseTimer.current}
    uniforms.pulsePosition.value={pulsePosition}
  />
  </Terrain>

  <!-- Torus shape -->
    <!-- <T.Mesh
        position={[0, 10, 0]}
        scale={[1, 1, 1]}
        rotation.x={rotation}
        castShadow>
        <T.TorusGeometry args={[4, .2, 16, 100]} />
        <T.ShaderMaterial
        
            fragmentShader={torusFragShader}
        />
    </T.Mesh> -->
  
  