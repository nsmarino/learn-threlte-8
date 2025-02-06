<script>
    import Terrain from "./Terrain.svelte"
    import fragmentShader from '../shaders/fragment.glsl?raw'
    import vertexShader from '../shaders/vertex.glsl?raw'
    import { OrbitControls } from '@threlte/extras'
    import { OrthographicCamera, Vector3 } from 'three'
    import { T } from '@threlte/core'
    import { Tween } from 'svelte/motion'
    import { interactivity } from '@threlte/extras'
    import { quadOut } from 'svelte/easing'

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
</script>

  <T.PerspectiveCamera
    makeDefault
    position={[0,50,0]}
    fov={15}
    oncreate={(ref) => {
      ref.lookAt(0, 0, 0)
    }}
  >

  </T.PerspectiveCamera>


    <T.DirectionalLight
        position={[0, 10, 10]}
        castShadow></T.DirectionalLight>
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
  
  