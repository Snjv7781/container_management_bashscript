# container_management_bashscript
Docker Manager: An Interactive Shell-Based Docker Management Tool

📌 Project Overview

Docker Manager is a CLI-based automation tool built using Bash scripting to simplify Docker container lifecycle management. It provides an interactive interface to manage images and containers efficiently, making it an essential utility for DevOps workflows.

🚀 Features

View Available Images: Lists all locally available Docker images.

Pull Docker Images: Fetches images from Docker Hub interactively.

Run Containers: Allows users to specify the image, version, and optional container name.

MySQL Deployment Support: Enables running MySQL containers with configurable environment variables.

Manage Running Containers: Supports stopping, removing, and viewing running containers.

Dynamic Naming: Generates unique container names using timestamps.

Robust Input Handling: Implements validation and error handling to ensure smooth operations.

🛠️ Technologies Used

Bash Scripting: Automates Docker operations.

Docker & Docker CLI: Manages containerized applications.

Linux Utilities (awk, date, grep, etc.): Enhances scripting efficiency.

📂 Installation & Usage

Prerequisites

Docker installed on the system.

Bash shell (for Unix/Linux/macOS environments).

Installation



# Make the script executable
chmod +x container-managment.sh

Usage

Run the script using:

./container-management.sh

Follow the on-screen instructions to select operations such as viewing images, pulling new images, running containers, or managing running containers.

📖 Example Usage

View Available Images:

Enter your choice: 1  # Displays locally available images

Pull an Image:

Enter your choice: 2  # Asks for image name and pulls it from Docker Hub

Run a MySQL Container:

Enter your choice: 3
Enter image name: mysql
Enter version (press Enter for latest): latest
Enter container name (optional): my-mysql

(Runs a MySQL container with necessary environment variables.)

🛡️ Error Handling & Best Practices

Checks for Docker installation before execution.

Ensures valid user input before running commands.

Implements graceful error handling to prevent unexpected failures.

🤝 Contributing

Feel free to fork this repository and submit pull requests for improvements.
