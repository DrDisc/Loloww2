#!/bin/bash
# Media Download Script for Lolo's War Project
# Downloads all media assets with direct URLs

echo "================================================"
echo "  Lolo's War - Media Download Script"
echo "================================================"
echo ""

# Create directories if they don't exist
echo "Creating directory structure..."
mkdir -p media/graphics/insignia
mkdir -p media/photos/philippine-scouts
mkdir -p media/photos/medal-of-honor
mkdir -p media/photos/bataan
mkdir -p media/photos/insignia
mkdir -p media/footage/b-roll
mkdir -p media/footage/historical
mkdir -p media/maps/static
mkdir -p media/maps/animated
echo "✓ Directories created"
echo ""

# Download Philippine Division Insignia (SVG)
echo "Downloading Philippine Division insignia (SVG)..."
curl -L -o media/graphics/insignia/philippine_division_insignia.svg \
  "https://upload.wikimedia.org/wikipedia/commons/6/67/12th_Infantry_Division_SSI.svg"

if [ $? -eq 0 ]; then
    echo "✓ Philippine Division insignia downloaded successfully"
else
    echo "✗ Failed to download insignia"
fi
echo ""

# Convert SVG to PNG at various resolutions (requires ImageMagick or similar)
if command -v convert &> /dev/null; then
    echo "Converting SVG to PNG formats..."
    convert -background none media/graphics/insignia/philippine_division_insignia.svg \
            -resize 512x512 media/graphics/insignia/philippine_division_insignia_512.png
    convert -background none media/graphics/insignia/philippine_division_insignia.svg \
            -resize 1024x1024 media/graphics/insignia/philippine_division_insignia_1024.png
    convert -background none media/graphics/insignia/philippine_division_insignia.svg \
            -resize 2048x2048 media/graphics/insignia/philippine_division_insignia_2048.png
    echo "✓ PNG versions created (512px, 1024px, 2048px)"
else
    echo "⚠ ImageMagick not found - skipping PNG conversion"
    echo "  Install with: sudo apt install imagemagick (Linux) or brew install imagemagick (Mac)"
fi
echo ""

# Try to download Jose Calugas photo from UW-Madison
echo "Attempting to download Jose Calugas Medal of Honor photo..."
# Note: This may not work due to site restrictions - manual download may be needed
curl -L -o media/photos/medal-of-honor/calugas_moh_ceremony_111-sc-205900_temp.jpg \
  "https://search.library.wisc.edu/digital/AUZPLBHD43WVQZ9C" 2>/dev/null

if [ -f media/photos/medal-of-honor/calugas_moh_ceremony_111-sc-205900_temp.jpg ] && [ -s media/photos/medal-of-honor/calugas_moh_ceremony_111-sc-205900_temp.jpg ]; then
    echo "✓ Calugas photo downloaded"
else
    rm -f media/photos/medal-of-honor/calugas_moh_ceremony_111-sc-205900_temp.jpg 2>/dev/null
    echo "⚠ Calugas photo download failed - requires manual download"
    echo "  URL: https://artsandculture.google.com/asset/...3wFoPUl_qjc8aQ"
fi
echo ""

echo "================================================"
echo "  Automated Downloads Complete!"
echo "================================================"
echo ""
echo "Downloaded:"
echo "  ✓ Philippine Division insignia (SVG)"
if command -v convert &> /dev/null; then
    echo "  ✓ Philippine Division insignia (PNG 512/1024/2048)"
fi
echo ""
echo "MANUAL DOWNLOADS STILL NEEDED:"
echo ""
echo "1. Jose Calugas MOH Photo"
echo "   → https://artsandculture.google.com/asset/sergeant-jose-calugas-a-philippine-scout-who-heroically-defended-bataan-during-the-japanese-invasion-after-becoming-the-first-filipino-to-receive-the-congressional-medal-of-honor-the-united-states%E2%80%99-highest-military-decoration-camp-olivas-luzon-april-30-1945-courtesy-of-the-national-archives-and-records-administration-111-sc-205900/3wFoPUl_qjc8aQ"
echo "   Save to: media/photos/medal-of-honor/"
echo ""
echo "2. PICRYL Battle of Philippines Photos (31 images)"
echo "   → https://picryl.com/topics/battle+of+the+philippines+1941+42"
echo "   Save to: media/photos/philippine-scouts/ or media/photos/bataan/"
echo ""
echo "3. PICRYL Bataan Maps (27 maps)"
echo "   → https://picryl.com/topics/maps+of+the+battle+of+the+philippines+1941+42"
echo "   Save to: media/maps/static/"
echo ""
echo "4. Wikimedia Commons - Philippine Scouts Category"
echo "   → https://commons.wikimedia.org/wiki/Category:Philippine_Scouts"
echo "   Save to: media/photos/philippine-scouts/"
echo ""
echo "5. Videvo Carabao Footage (requires free account)"
echo "   → https://www.videvo.net/stock-video-footage/carabao/"
echo "   Save to: media/footage/b-roll/"
echo ""
echo "6. Pexels Rice Field Footage (no account needed)"
echo "   → https://www.pexels.com/search/videos/rice%20field/"
echo "   Save to: media/footage/b-roll/"
echo ""
echo "7. NARA Catalog Philippine Scouts Search"
echo "   → https://catalog.archives.gov/"
echo "   Search: \"Philippine Scouts\" 1941-1942, RG 111"
echo "   Save to: media/photos/philippine-scouts/"
echo ""
echo "================================================"
echo "See DOWNLOAD-WORKFLOW.md for detailed instructions"
echo "See DOWNLOAD-MANIFEST.md for all URLs and methods"
echo "================================================"
