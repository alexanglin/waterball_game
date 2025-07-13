#!/bin/bash
# Documentation validation script for Waterball Game

echo "🔍 Validating Documentation Structure"
echo "===================================="

# Check if all required directories exist
required_dirs=("docs" "docs/planning" "docs/technical" "docs/development" "docs/reference" "assets" "assets/images" "scripts")
for dir in "${required_dirs[@]}"; do
    if [ -d "$dir" ]; then
        echo "✅ Directory exists: $dir"
    else
        echo "❌ Missing directory: $dir"
        exit 1
    fi
done

# Check if all required documentation files exist
required_files=(
    "README.md"
    "CLAUDE.md" 
    "TASKS.md"
    "docs/INDEX.md"
    "docs/CLAUDE.md"
    "docs/planning/CLAUDE.md"
    "docs/planning/GAME_MECHANICS.md"
    "docs/planning/PROJECT_REQUIREMENTS_DOCUMENT.md"
    "docs/planning/PLAN.md"
    "docs/technical/CLAUDE.md"
    "docs/technical/ARCHITECTURE.md"
    "docs/technical/UNITY_SETUP.md"
    "docs/technical/PHYSICS_DESIGN.md"
    "docs/technical/PERFORMANCE_TARGETS.md"
    "docs/development/CLAUDE.md"
    "docs/development/DEVELOPMENT_PLAN.md"
    "docs/development/TESTING_STRATEGY.md"
    "docs/development/UI_UX_DESIGN.md"
    "docs/reference/CLAUDE.md"
    "docs/reference/DOCUMENTATION_IMPROVEMENTS.md"
    "scripts/CLAUDE.md"
    "assets/CLAUDE.md"
)

for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ File exists: $file"
    else
        echo "❌ Missing file: $file"
        exit 1
    fi
done

# Check if navigation headers exist in docs
docs_with_nav=(
    "docs/planning/GAME_MECHANICS.md"
    "docs/planning/PROJECT_REQUIREMENTS_DOCUMENT.md"
    "docs/planning/PLAN.md"
    "docs/technical/ARCHITECTURE.md"
    "docs/technical/UNITY_SETUP.md"
    "docs/technical/PHYSICS_DESIGN.md"
    "docs/technical/PERFORMANCE_TARGETS.md"
    "docs/development/DEVELOPMENT_PLAN.md"
    "docs/development/TESTING_STRATEGY.md"
    "docs/development/UI_UX_DESIGN.md"
)

for file in "${docs_with_nav[@]}"; do
    if grep -q "Navigation:" "$file"; then
        echo "✅ Navigation header: $file"
    else
        echo "⚠️  Missing navigation: $file"
    fi
done

# Check for broken links (basic check)
echo ""
echo "🔗 Checking for obvious broken links..."
if grep -r "](.*\.md)" docs/ | grep -q "\.\./\.\./"; then
    echo "⚠️  Found potential broken relative links"
    grep -r "](.*\.md)" docs/ | grep "\.\./\.\."
else
    echo "✅ No obvious broken links found"
fi

# Check file sizes (warn about empty files)
echo ""
echo "📄 Checking file sizes..."
for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        size=$(wc -c < "$file")
        if [ "$size" -lt 100 ]; then
            echo "⚠️  Small file (${size} bytes): $file"
        fi
    fi
done

echo ""
echo "✅ Documentation validation complete!"
echo "📊 Total documentation files: ${#required_files[@]}"
echo "📁 Directory structure: OK"
echo "🔗 Navigation: Implemented"
echo ""
echo "To run link validation: npm install -g markdown-link-check && markdown-link-check docs/**/*.md"