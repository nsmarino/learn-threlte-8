<script>
    import content from '$lib/content';
</script>
<section class="p-8 h-screen overflow-scroll">
    <div class="h-[120px] bg-black fixed top-0 z-20 mb-8 flex items-center">
        <h1 class="uppercase text-white">Arboretum&nbsp;<a href="https://www.zero.nyc" target="_blank" class="zero"></a></h1>
    </div>
    <ul class="text-white flex flex-col gap-12 my-[120px]">
        {#each content as demo}
            <li>
                <a href={demo.slug} class="polaroid">
                    <span class="emoji">{demo.emoji}</span>
                    <span class="label">{demo.label}</span>
                </a>
            </li>
        {/each}
    </ul>
</section>

<style>
    .zero {
        width: 30px;
        height: 30px;
        background-color: white;
        display: inline-block;
        border-radius: 100%;
    }
    .polaroid {
        text-decoration: none;
        display: flex;        
        text-decoration: none;
        width: fit-content;
        align-items: center;
        gap: 12px;
    }
    .polaroid .emoji {
        font-size: 60px;
        text-align: center;
        text-decoration: none;
        line-height: 0;
        height: 0px;
    }
    .label {
        position: relative;
        display: inline-block;
        height: 100%;
        margin: 10px 0;
    }
    .label:after {
    content: "";
    display: block;
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 1px;
    background-color: white;
    transform: scaleX(0);
    transition: all .2s ease-out;
    transform-origin: left;
    }
    .polaroid:hover .label:after {
        transform: scaleX(1);
    }

</style>
