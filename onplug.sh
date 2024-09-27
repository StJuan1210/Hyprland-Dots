session_id=$(loginctl list-sessions | awk '$6 == "user" {print $1}')

# Change the refresh rate of the monitor to 165Hz

config_file="/home/juangt/.config/hypr/UserConfigs/Monitors.conf"
sed -i 's/2560x1600@60/2560x1600@165/' "$config_file"
echo "Refresh rate changed to 165Hz"

# Change cpu governor to performance

sudo auto-cpufreq --force=performance
echo "CPU governor changed to Performance"

# Change to Hybrid graphics

supergfxctl -m Hybrid 
echo "Graphics changed to Hybrid"

echo "Logging out in 5 seconds (session_id: $session_id)"
sleep 5
loginctl kill-session $session_id