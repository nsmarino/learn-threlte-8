<script>
  import ScrollScene from "$lib/components/ScrollScene.svelte";
import Sidebar from "$lib/components/Sidebar.svelte";

</script>
<Sidebar
    heading="Scroll"
    description="Scrollable content."
/>
<section class="w-full h-full fixed">
  <ScrollScene />
</section>
<section class="h-[800vh]"></section>
