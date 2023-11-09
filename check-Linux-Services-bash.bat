#!/bin/bash
# This script checks for stopped services and starts them

# List of services to check
services=("apache2" "mysql" "sshd")

# Iterate through the list of services
for service in "${services[@]}"; do
    # Check if the service is running
    if systemctl is-active --quiet "$service"; then
        echo "Service $service is running."
    else
        # If the service is stopped, start it
        echo "Service $service is stopped. Starting it now..."
        systemctl start "$service"

        # Check if the service started successfully
        if systemctl is-active --quiet "$service"; then
            echo "Service $service started successfully."
        else
            echo "Failed to start $service."
        fi
    fi
done

# Display a message indicating the end of the script
echo "Service check and start script complete."
