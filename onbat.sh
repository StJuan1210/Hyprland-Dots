session_id=$(loginctl list-sessions | awk '$6 == "user" {print $1}')

# Change the refresh rate of the monitor to 60Hz

config_file="/home/juangt/.config/hypr/UserConfigs/Monitors.conf"
sed -i 's/2560x1600@165/2560x1600@60/' "$config_file"
echo "Refresh rate changed to 60Hz"

# Change cpu governor to powersave

sudo auto-cpufreq --force=powersave
echo "CPU governor changed to powersave"

# Change to integrated graphics

supergfxctl -m Integrated
echo "Graphics changed to integrated"

echo "Logging out in 5 seconds (session_id: $session_id)"
sleep 5
loginctl kill-session $session_id