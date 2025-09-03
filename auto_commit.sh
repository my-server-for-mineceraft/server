cd /workspaces/server

while true; do
    git add .
    git commit -m "Auto-save: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main  
    SLEEP_TIME=$((600 + RANDOM % 1200)) 
    echo "Next auto-commit in $SLEEP_TIME seconds..."
    sleep $SLEEP_TIME
done
