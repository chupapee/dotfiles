#!/usr/bin/env bash

theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
# remove single quotes
theme=${theme//\'/}

if [ "$theme" = "Adwaita-dark" ]; then
  sed -i "s/Adwaita-dark/Adwaita/g" ~/.config/gtk-3.0/settings.ini
  gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
  echo "Light mode activated"
else
  sed -i "s/Adwaita/Adwaita-dark/g" ~/.config/gtk-3.0/settings.ini
  gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
  echo "Darkness surrounds us"
fi

# TODO: autoreload running apps after changing the theme

# Get the PIDs of the processes associated with the specified applications
# PIDS=$(pgrep -af "telegram|chrome|code")

# Check if there are any processes to restart
# if [ -n "$PIDS" ]; then
#   echo "Restarting processes: $PIDS"

  # Send a termination signal to the processes
  # kill -TERM $PIDS

  # Add any additional commands needed to start the applications here
  # For example: "telegram_command" & "chrome_command" & "code_command" &

#   echo "Processes restarted."
# else
#   echo "No processes found for specified applications."
# fi
