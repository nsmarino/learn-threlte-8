<script>
  import { onMount } from "svelte";
  import * as d3 from "d3";
  import Sidebar from "$lib/components/Sidebar.svelte";

function generateTree(svg, startX, startY, length, angle, depth, maxDepth) {
    if (depth > maxDepth) return;

    const noise = (Math.random() - 0.5) * 20; // Add some randomness to angles
    const newAngle1 = angle - 20 + noise;
    const newAngle2 = angle + 20 + noise;
    const newLength = length * (0.7 + Math.random() * 0.2); // Vary branch length

    const endX = startX + length * Math.cos(angle * Math.PI / 180);
    const endY = startY - length * Math.sin(angle * Math.PI / 180);

    const line = svg.append("line")
        .attr("x1", startX)
        .attr("y1", startY)
        .attr("x2", endX)
        .attr("y2", endY)
        .attr("stroke", "white")
        .attr("stroke-width", Math.max(1, (maxDepth - depth) * 2))
        // .attr("stroke-linecap", "round")
        .attr("stroke-dasharray", length + " " + length) // Set total path length
        .attr("stroke-dashoffset", length); // Hide the stroke initially


    line.transition()
        .ease(d3.easeLinear)
        .duration(150)
        .attr("stroke-dashoffset", 0) // Animate stroke drawing
        .on("end", function() {

            // Build off of this to create leaves:
            // svg.append("circle").attr("cx", endX).attr("cy", endY).attr("r", 3).style("fill", "purple")

            // Recursively create branches only after animation completes
            generateTree(svg, endX, endY, newLength, newAngle1, depth + 1, maxDepth);
            generateTree(svg, endX, endY, newLength, newAngle2, depth + 1, maxDepth);
        });

    // Recursively create branches
    // generateTree(svg, endX, endY, newLength, newAngle1, depth + 1, maxDepth);
    // generateTree(svg, endX, endY, newLength, newAngle2, depth + 1, maxDepth);
}
// Initialize SVG and call the function
onMount(()=> {
    const width = 500, height = 500;
    for (let i = 0; i < 6; i++) {
        const svg = d3.select(".tree-container").append("svg")
            .attr("width", width)
            .attr("height", height);
    
        generateTree(svg, width / 2, height, 100, 90, 0, 6);
    }    
}

);

</script>
<Sidebar
    heading="SVG Generation With D3"
    description="Generating and animating tree shapes"
></Sidebar>
<div class="tree-container flex border-b-white border-b-2 w-full overflow-x-scroll [&>svg]:shrink-[0] mt-24"></div>
