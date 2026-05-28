# Automatically stage all changes
exec git add .
# Commit changes with a standard message
exec git commit -m "Auto-commit from ModelSim Transcript Console"
# Push to GitHub
exec git push origin main
echo "🚀 NIK-CORE Code Successfully Synced to GitHub!"