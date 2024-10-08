const svg = d3.select("#diagram")
    .append("svg")
    .attr("width", "100%")
    .attr("height", "100%")
    .attr("viewBox", "0 0 800 500");

const g = svg.append("g");

const zoom = d3.zoom()
    .scaleExtent([0.5, 5]) // Set the zoom scale range
    .on("zoom", zoomed);

svg.call(zoom);

function zoomed(event) {
    g.attr("transform", event.transform);
}

// Define gradients
const defs = svg.append("defs");

const gradient = defs.append("linearGradient")
    .attr("id", "layerGradient")
    .attr("x1", "0%")
    .attr("y1", "0%")
    .attr("x2", "100%")
    .attr("y2", "100%");

gradient.append("stop")
    .attr("offset", "0%")
    .attr("stop-color", "#a8e6cf")
    .attr("stop-opacity", 1);

gradient.append("stop")
    .attr("offset", "100%")
    .attr("stop-color", "#dcedc1")
    .attr("stop-opacity", 1);

// Define shadow filter
defs.append("filter")
    .attr("id", "shadow")
    .append("feDropShadow")
    .attr("dx", 2)
    .attr("dy", 2)
    .attr("stdDeviation", 2)
    .attr("flood-color", "#666");

// Append tooltip element to body
const tooltip = d3.select("body").append("div")
    .attr("class", "tooltip")
    .style("position", "absolute")
    .style("background-color", "#f9f9f9")
    .style("border", "1px solid #ccc")
    .style("padding", "8px")
    .style("border-radius", "4px")
    .style("display", "none")
    .style("pointer-events", "none");

const layers = [
    {name: "Interaction Layer", color: "url(#layerGradient)", x: 0, y: 50, width: 760, height: 100},
    {name: "Backend & Deployment Layer", color: "url(#layerGradient)", x: 0, y: 200, width: 760, height: 100},
    {name: "Database Layer", color: "url(#layerGradient)", x: 0, y: 350, width: 760, height: 100}
];

layers.forEach(layer => {
    g.append("rect")
        .attr("x", layer.x)
        .attr("y", layer.y)
        .attr("width", layer.width)
        .attr("height", layer.height)
        .attr("fill", layer.color)
        .attr("filter", "url(#shadow)")
        .on("mouseover", function(event) {
            tooltip.html(Layer: <br>Details about this layer...)
                .style("left", (event.pageX + 10) + "px")
                .style("top", (event.pageY - 20) + "px")
                .style("display", "block");
        })
        .on("mouseout", function() {
            tooltip.style("display", "none");
        })
        .on("click", function() {
            alert(Clicked on );
        });

    g.append("text")
        .attr("x", layer.x + layer.width / 2)
        .attr("y", layer.y + layer.height / 2)
        .attr("dy", ".35em")
        .attr("text-anchor", "middle")
        .attr("font-size", "20px")
        .attr("fill", "#333")
        .text(layer.name);
});

// Add arrows and labels
g.append("line")
    .attr("x1", 380)
    .attr("y1", 150)
    .attr("x2", 380)
    .attr("y2", 200)
    .attr("stroke", "#333")
    .attr("stroke-width", 2)
    .attr("marker-end", "url(#arrow)");

g.append("line")
    .attr("x1", 380)
    .attr("y1", 300)
    .attr("x2", 380)
    .attr("y2", 350)
    .attr("stroke", "#333")
    .attr("stroke-width", 2)
    .attr("marker-end", "url(#arrow)");

g.append("text")
    .attr("x", 390)
    .attr("y", 175)
    .attr("dy", ".35em")
    .attr("font-size", "14px")
    .attr("fill", "#333")
    .text("Sends Requests");

g.append("text")
    .attr("x", 390)
    .attr("y", 325)
    .attr("dy", ".35em")
    .attr("font-size", "14px")
    .attr("fill", "#333")
    .text("Queries");

// Add arrow markers
defs.append("marker")
    .attr("id", "arrow")
    .attr("viewBox", "0 0 10 10")
    .attr("refX", 5)
    .attr("refY", 5)
    .attr("markerWidth", 6)
    .attr("markerHeight", 6)
    .attr("orient", "auto")
  .append("path")
    .attr("d", "M 0 0 L 10 5 L 0 10 z")
    .attr("fill", "#333");
