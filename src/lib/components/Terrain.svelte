<script>
    import { T } from '@threlte/core'
    import { PlaneGeometry, Vector3 } from 'three'
    import { SimplexNoise } from 'three/examples/jsm/Addons.js'
    import { DEG2RAD } from 'three/src/math/MathUtils.js'

    let {
        clickHandler,
        children
    } = $props()

    // Terrain setup
    const terrainSize = 30
    const geometry = new PlaneGeometry(terrainSize, terrainSize, 100, 100)
    const noise = new SimplexNoise()
  
    const vertices = geometry.getAttribute('position')
    for (let i = 0; i < vertices.count; i += 1) {
      const x = vertices.getX(i)
      const y = vertices.getY(i)
      vertices.setZ(i, noise.noise(x / 5, y / 5) * 2 + noise.noise(x / 40, y / 40) * 3)
    }
    geometry.computeVertexNormals()
</script>

<T.Mesh
    {geometry}
    
    rotation.x={DEG2RAD * -90}
    onclick={clickHandler}
  >
    {@render children?.()}
</T.Mesh>