#!/bin/bash

# Set to fail script on error
set -e

# Function to set up systemd services
setup_services() {
    echo "Setting up Clearpath systemd services..."

    # Install the service files
    sudo cp clearpath-robot.service /etc/systemd/system/clearpath-robot.service
    sudo cp clearpath-platform.service /etc/systemd/system/clearpath-platform.service
    sudo cp clearpath-sensors.service /etc/systemd/system/clearpath-sensors.service

    # Reload systemd to recognize the new services
    sudo systemctl daemon-reload

    # Enable services to start on boot
    sudo systemctl enable clearpath-robot.service
    sudo systemctl enable clearpath-platform.service
    sudo systemctl enable clearpath-sensors.service

    echo "Clearpath services installed and enabled."
}

# Function to set up ROS environment (OPTIONAL: Can be removed if ROS environment is already set up)
setup_ros_environment() {
    echo "Skipping ROS2 and Clearpath package installation as requested."
    echo "Ensure that your ROS2 environment is correctly set up and sourced."
}

# Main Script Execution
setup_ros_environment
setup_services

echo "Installation complete."
