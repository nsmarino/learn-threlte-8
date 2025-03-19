<script>
    import { onMount } from 'svelte';
    import { Canvas, T } from '@threlte/core';
  
    let rotate = $state(0)
  
    onMount(() => {
      const handleScroll = () => {
        const scrollY = window.scrollY;
        const rotationSpeed = 0.005;
        rotate = scrollY * rotationSpeed;
      };
  
      window.addEventListener('scroll', handleScroll);
  
      return () => {
        window.removeEventListener('scroll', handleScroll);
      };
    });
  </script>
  
  <Canvas>
    <T.Mesh rotation.x={rotate} rotation.y={rotate}>
      <T.BoxGeometry />
      <T.MeshBasicMaterial color="white" />
    </T.Mesh>
  </Canvas>