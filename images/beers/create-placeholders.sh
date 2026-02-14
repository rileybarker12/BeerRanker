#!/bin/bash
# Create SVG placeholder images for each beer

beers=(
  "bud-light:Bud Light"
  "modelo-especial:Modelo Especial"
  "michelob-ultra:Michelob Ultra"
  "coors-light:Coors Light"
  "miller-lite:Miller Lite"
  "corona-extra:Corona Extra"
  "budweiser:Budweiser"
  "heineken:Heineken"
  "busch-light:Busch Light"
  "natural-light:Natural Light"
  "dos-equis:Dos Equis"
  "blue-moon:Blue Moon"
  "stella-artois:Stella Artois"
  "guinness:Guinness"
  "yuengling:Yuengling"
  "pabst-blue-ribbon:Pabst Blue Ribbon"
  "shiner:Shiner"
  "miller-high-life:Miller High Life"
  "keystone-light:Keystone Light"
  "coors-banquet:Coors Banquet"
)

for beer_info in "${beers[@]}"; do
  IFS=':' read -r filename displayname <<< "$beer_info"
  cat > "${filename}.svg" << SVG
<svg width="400" height="400" xmlns="http://www.w3.org/2000/svg">
  <rect width="400" height="400" fill="#f4a460"/>
  <g transform="translate(200, 200)">
    <!-- Beer bottle shape -->
    <rect x="-40" y="-120" width="80" height="200" rx="10" fill="#8B4513" opacity="0.8"/>
    <rect x="-30" y="-140" width="60" height="30" rx="5" fill="#654321"/>
    <ellipse cx="0" cy="-140" rx="30" ry="10" fill="#FFD700"/>
    <!-- Label area -->
    <rect x="-35" y="-60" width="70" height="80" fill="#FFF" opacity="0.9"/>
  </g>
  <text x="200" y="350" text-anchor="middle" font-family="Arial, sans-serif" font-size="20" font-weight="bold" fill="#333">${displayname}</text>
  <text x="200" y="380" text-anchor="middle" font-family="Arial, sans-serif" font-size="14" fill="#666">Placeholder - Replace with actual image</text>
</svg>
SVG
done

echo "Created ${#beers[@]} placeholder SVG images"
