cd /workspaces/server

while true; do
    git add .

    if git show HEAD:minecraft_server/plugins/DiscordSRV/config.yml >/dev/null 2>&1; then
        OLD_LINE9=$(git show HEAD:minecraft_server/plugins/DiscordSRV/config.yml | sed -n '9p')

        awk -v old="$OLD_LINE9" 'NR==9{$0=old} {print}' \
            minecraft_server/plugins/DiscordSRV/config.yml > tmpfile && mv tmpfile minecraft_server/plugins/DiscordSRV/config.yml

        git add minecraft_server/plugins/DiscordSRV/config.yml
    fi

    git commit -m "Auto-save: $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"
    git push origin main --force || echo "Force push failed"

    SLEEP_TIME=$((600 + RANDOM % 1200)) 
    echo "Next auto-commit in $SLEEP_TIME seconds..."
    sleep $SLEEP_TIME
done
