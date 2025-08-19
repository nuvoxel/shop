# NuVoxel Shopify Theme Integration

This directory contains custom Shopify theme files that match your Hydrogen app's header and footer design.

## Two Integration Options

### Option 1: Redirect (Recommended)
Configure shop.nuvoxel.com to redirect to hydrogen.nuvoxel.com/shop
- In Shopify Admin > Online Store > Navigation
- Add a redirect from shop.nuvoxel.com to hydrogen.nuvoxel.com/shop
- All users will see the integrated experience

### Option 2: Custom Theme Files
Upload these theme files to your Shopify store to have matching header/footer on shop.nuvoxel.com

## Installation Instructions

### Via Shopify CLI
```bash
# Install Shopify CLI if not already installed
npm install -g @shopify/cli

# Login to your store
shopify auth login --store shop.nuvoxel.com

# Upload the theme files
shopify theme push --path ./shopify-theme
```

### Manual Installation
1. Go to Shopify Admin > Online Store > Themes
2. Click "Add theme" > "Upload zip"
3. Or edit your current theme:
   - Click "Actions" > "Edit code"
   - Copy the contents of each file:
     - `snippets/nuvoxel-header.liquid` → Create new snippet
     - `snippets/nuvoxel-footer.liquid` → Create new snippet
     - `layout/theme.liquid` → Replace existing theme.liquid

## Files Included

- **layout/theme.liquid** - Main theme layout with NuVoxel header/footer
- **snippets/nuvoxel-header.liquid** - Custom header matching your app
- **snippets/nuvoxel-footer.liquid** - Custom footer matching your app

## Features

- Responsive design matching your Next.js app
- Cart count integration
- Consistent navigation links
- Message passing to parent frame when embedded
- Amiko font to match your brand

## Testing

After installation:
1. Visit shop.nuvoxel.com directly to see the custom theme
2. Visit hydrogen.nuvoxel.com/shop to see the embedded version
3. Both should have consistent header/footer styling

## Customization

To update colors or styles:
- Primary color (emerald): #10b981
- Text colors match your app's theme
- Font: Amiko (loaded from Google Fonts)