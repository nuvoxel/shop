#!/bin/bash

# NuVoxel Shopify Theme Deployment Script
# This script deploys the custom theme to your Shopify store

echo "🚀 NuVoxel Shopify Theme Deployment"
echo "===================================="

# Check if Shopify CLI is installed
if ! command -v shopify &> /dev/null; then
    echo "❌ Shopify CLI is not installed."
    echo "Please install it first:"
    echo "  npm install -g @shopify/cli @shopify/theme"
    exit 1
fi

# Store URL
STORE_URL="shop.nuvoxel.com"
THEME_PATH="./shopify-theme"

echo "📦 Preparing to deploy theme to: $STORE_URL"
echo ""

# Check if theme directory exists
if [ ! -d "$THEME_PATH" ]; then
    echo "❌ Theme directory not found at: $THEME_PATH"
    exit 1
fi

# Login to Shopify (if not already logged in)
echo "🔐 Authenticating with Shopify..."
shopify auth login --store="$STORE_URL" 2>/dev/null || true

# Options for deployment
echo ""
echo "Select deployment option:"
echo "1) Deploy as development theme (recommended for testing)"
echo "2) Deploy as live theme (will replace current live theme)"
echo "3) Deploy as unpublished theme"
echo ""
read -p "Enter option (1-3): " option

case $option in
    1)
        echo "🔧 Deploying as development theme..."
        shopify theme push --development --store="$STORE_URL" --path="$THEME_PATH"
        echo ""
        echo "✅ Development theme deployed!"
        echo "Preview at: https://$STORE_URL/?preview_theme_id=YOUR_THEME_ID"
        ;;
    2)
        echo "⚠️  WARNING: This will replace your current live theme!"
        read -p "Are you sure? (yes/no): " confirm
        if [ "$confirm" = "yes" ]; then
            echo "🚀 Deploying as live theme..."
            shopify theme push --live --store="$STORE_URL" --path="$THEME_PATH" --allow-live
            echo ""
            echo "✅ Live theme deployed!"
            echo "Visit: https://$STORE_URL"
        else
            echo "❌ Deployment cancelled"
            exit 0
        fi
        ;;
    3)
        read -p "Enter theme name: " theme_name
        echo "📤 Deploying as unpublished theme: $theme_name"
        shopify theme push --unpublished --theme="$theme_name" --store="$STORE_URL" --path="$THEME_PATH"
        echo ""
        echo "✅ Unpublished theme deployed!"
        echo "You can preview and publish it from your Shopify admin panel"
        ;;
    *)
        echo "❌ Invalid option"
        exit 1
        ;;
esac

echo ""
echo "📝 Next steps:"
echo "1. Test the theme thoroughly"
echo "2. Configure theme settings in Shopify admin"
echo "3. Ensure all products have proper images and descriptions for SEO"
echo ""
echo "🎉 Deployment complete!"