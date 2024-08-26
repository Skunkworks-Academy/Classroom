# Set the base directory
$baseDir = "C:\Classroom-Template"

# Fetch the repository
$repoUrl = "https://github.com/Skunkworks-Academy/Classroom-Template.git"
$cloneDir = Join-Path $baseDir "Classroom-Template"

# Clone the repository if it doesn't exist
if (-Not (Test-Path $cloneDir)) {
    git clone $repoUrl $cloneDir
} else {
    Write-Host "Repository already cloned in $cloneDir"
}

# Create the surms-diagram directory and files
$diagramDir = Join-Path $baseDir "surms-diagram"

if (-Not (Test-Path $diagramDir)) {
    New-Item -ItemType Directory -Path $diagramDir
}

# Create index.html
$indexHtmlPath = Join-Path $diagramDir "index.html"
@"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SURMS System Architecture Diagram</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="diagram-container">
        <img src="assets/info@skunkworks.africa_01.png" alt="Skunkworks Logo" class="logo">
        <div id="diagram"></div>
    </div>
    <script src="https://d3js.org/d3.v7.min.js"></script>
    <script src="diagram.js"></script>
</body>
</html>
"@ > $indexHtmlPath

# Create styles.css
$stylesCssPath = Join-Path $diagramDir "styles.css"
@"
body {
    font-family: Arial, sans-serif;
    background-color: #ffffff;
    margin: 0;
    padding: 0;
}

.diagram-container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    padding: 20px;
}

.logo {
    width: 100px;
    margin-bottom: 20px;
}

#diagram {
    width: 100%;
    max-width: 100%;
    height: auto;
    background-color: #f4f4f4;
    border: 1px solid #ddd;
}

.tooltip {
    position: absolute;
    background-color: #f9f9f9;
    border: 1px solid #ccc;
    padding: 8px;
    border-radius: 4px;
    display: none;
    pointer-events: none;
}

@media (max-width: 600px) {
    .diagram-container {
        flex-direction: column;
    }

    .logo {
        width: 80px;
    }
}
"@ > $stylesCssPath

# Create diagram.js
$diagramJsPath = Join-Path $diagramDir "diagram.js"
@"
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
            tooltip.html(`Layer: ${layer.name}<br>Details about this layer...`)
                .style("left", (event.pageX + 10) + "px")
                .style("top", (event.pageY - 20) + "px")
                .style("display", "block");
        })
        .on("mouseout", function() {
            tooltip.style("display", "none");
        })
        .on("click", function() {
            alert(`Clicked on ${layer.name}`);
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
"@ > $diagramJsPath

# Create the assets directory and copy images
$assetsDir = Join-Path $diagramDir "assets"

if (-Not (Test-Path $assetsDir)) {
    New-Item -ItemType Directory -Path $assetsDir
}

# Copy images from the repository if they exist (replace these paths if necessary)
$imageSourceDir = Join-Path $cloneDir "assets"
$imageFiles = @("info@skunkworks.africa_01.png", "info@skunkworks.africa_white.png", "Figure_1.png")

foreach ($image in $imageFiles) {
    $sourcePath = Join-Path $imageSourceDir $image
    $destPath = Join-Path $assetsDir $image
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $destPath
    } else {
        Write-Host "Warning: $image not found in source directory."
    }
}

Write-Host "SURMS diagram project structure created successfully in $diagramDir"
