<script lang="ts">

interface Props {
    heading: string;
    description: string;
}
 let { heading, description }: Props = $props();
</script>

<section class="p-4 absolute left-4 bottom-4 z-20 w-[600px] h-fit bg-black border border-white">
    <h1 class="h5 uppercase mb-8">{heading}</h1>  
    <p class="mb-4">{description}</p>
    <p><a href="/" class="w-10 h-10 block rounded-full bg-white flex items-center justify-center back-btn"><span>🔙</span></a></p>
</section>

<style>
.back-btn:hover span {
    transform: scale(1.25);
    transition: transform 0.2s cubic-bezier(0.075, 0.82, 0.165, 1);
}
.back-btn span {
    transform: scale(1);
    transition: transform 0.2s cubic-bezier(0.075, 0.82, 0.165, 1);
}
</style>