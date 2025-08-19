# Shopify Theme Integration Documentation

## Overview
This document describes the custom Shopify theme integration for the NuVoxel resale store, which maintains visual consistency with the main NuVoxel/Hydrogen website.

## Project Structure

### Theme Location
- **Path**: `/shopify-theme/`
- **Store URL**: https://qpvtn1-1z.myshopify.com
- **Admin URL**: https://admin.shopify.com/store/qpvtn1-1z

### Key Theme Files

#### 1. Layout
- **`layout/theme.liquid`**: Main theme wrapper
  - Includes Amiko font from Google Fonts
  - Sets up SEO meta tags and structured data for products
  - Removes default Shopify header/footer
  - Special handling for homepage to remove padding

#### 2. Custom Components

##### Header (`snippets/nuvoxel-header.liquid`)
- Sticky navigation matching main site
- Navy blue color scheme (#163172 primary, #0e1e42 hover)
- Logo left-aligned
- Navigation links: Products, Pricing, Cloud Ripoff, Shop (active), Contact Us
- Shopping cart icon with item count
- No border/divider below header

##### Footer (`snippets/nuvoxel-footer.liquid`)
- Four-column layout on desktop: Logo/Info, Company, Legal (2 columns), Social
- Legal section has two-column layout:
  - Column 1: Terms, Privacy, Cookies
  - Column 2: Data Processing Agreement, Do Not Sell/Share My Info
- Social links: Blog, LinkedIn, YouTube
- Copyright with "Built with ❤️ in Silicon Valley"

#### 3. Templates

##### Homepage (`templates/index.liquid`)
Key sections:
1. **Hero Section**
   - Emerald gradient background (emerald-900, teal-900, green-800)
   - Starts immediately below header (no padding)
   - Mentions Crying Cloud YouTube merchandise

2. **Categories Section**
   - White cards with subtle shadows
   - 3-column grid on desktop
   - Dynamic icons based on collection handle
   - Dark blue section title (#163172)

3. **Newsletter Signup**
   - Emerald gradient background
   - Shopify customer form integration
   - Features: Inventory alerts, Exclusive deals, Crying Cloud merch

4. **CTA Section**
   - Emerald green buttons (#059669, darker #047857 on hover)
   - Links to all products and contact sales

## Design System

### Colors
- **Primary Blue**: #163172 (used for header text, navigation)
- **Dark Blue (hover)**: #0e1e42
- **Emerald Green**: #059669 (primary green for buttons, prices, links)
- **Dark Emerald**: #047857 (hover state for green elements)
- **Text Gray**: #6b7280
- **Dark Text**: #111827

### Typography
- **Font Family**: Amiko (primary), system fonts fallback
- **Section Titles**: 30px, bold, #163172
- **Body Text**: 16px, #6b7280

### Spacing
- **Section Padding**: 80px vertical
- **Container Max Width**: 1280px
- **Card Padding**: 24px
- **Grid Gap**: 32px

## Deployment

### Using Shopify CLI
```bash
# Navigate to theme directory
cd shopify-theme

# Deploy to live theme
npx shopify theme push --live --allow-live --force

# Deploy specific files only
npx shopify theme push --live --allow-live --force --only templates/index.liquid
```

### Important Notes
1. **DO NOT** modify `assets/nuvoxel-logo.svg` directly - it's a generated asset
2. Always test changes on development theme first if available
3. The theme uses Shopify's Liquid templating language

## Integration with Main Site

### Resale Page (`src/components/ResaleLandingPage.tsx`)
- Links to `/shop` which redirects to Shopify store
- Maintains consistent messaging about cloud transformation
- Uses same color scheme and iconography

### Shared Design Elements
1. Navigation structure and styling
2. Footer layout and content
3. Color palette (blues and emerald greens)
4. Typography (Amiko font)
5. Button styles and hover effects
6. Card-based layouts for categories/services

## Maintenance

### Adding New Categories
Categories are dynamically pulled from Shopify collections. Icons are assigned based on collection handle keywords:
- `server` → Server icon
- `network` → Network icon
- `storage` → Database icon
- `part`/`component` → Package icon
- `workstation`/`desktop` → Monitor icon
- Default → Package icon

### Updating Content
1. Hero section text: Edit `templates/index.liquid` lines 9-23
2. Newsletter features: Edit `templates/index.liquid` lines 173-195
3. Footer links: Edit `snippets/nuvoxel-footer.liquid`

### Testing Checklist
- [ ] Header navigation colors and hover states (blue #163172)
- [ ] Hero gradient starts immediately after header
- [ ] Category cards display correctly
- [ ] Footer columns align properly (two-column legal section)
- [ ] Newsletter signup works
- [ ] Cart functionality
- [ ] Mobile responsiveness
- [ ] Product page colors (green #059669 for prices and buttons)
- [ ] Collection page colors and badges
- [ ] Cart page checkout button and pricing colors

## Troubleshooting

### Common Issues
1. **Logo not displaying**: Check `assets/nuvoxel-logo.svg` exists
2. **Colors incorrect**: Verify hex codes in CSS match design system
3. **Layout issues**: Check grid template columns in CSS
4. **Deployment errors**: Use `--force` flag to override conflicts

### Support Resources
- Shopify Theme Documentation: https://shopify.dev/themes
- Liquid Reference: https://shopify.dev/api/liquid
- Store Admin: https://admin.shopify.com/store/qpvtn1-1z

## Future Enhancements
- Product quick view functionality
- Enhanced search with filters
- Customer reviews integration
- Wishlist functionality
- Multi-currency support
- Checkout page customization (Note: Shopify Plus required for full checkout customization)

---

*Last Updated: December 2024*
*Maintained by: NuVoxel Development Team*