#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}🔨 Building Nice Redirect Chrome Extension...${NC}"

# Create builds directory
mkdir -p builds

# Remove old zip
rm -f builds/chrome.zip

# Create zip file
zip -r builds/chrome.zip src/ README.md -x "*.DS_Store"

if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Build successful!${NC}"
  echo -e "${GREEN}📦 Archive: builds/chrome.zip${NC}"
  
  # Get file size
  SIZE=$(du -h builds/chrome.zip | cut -f1)
  echo -e "${GREEN}📊 Size: $SIZE${NC}"
else
  echo -e "${RED}❌ Build failed!${NC}"
  exit 1
fi