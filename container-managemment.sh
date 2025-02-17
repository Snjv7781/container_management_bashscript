#!/bin/bash

echo "Welcome to the Docker Management Tool"


show_images() {
    echo "Available Docker Images:"
    docker images | awk 'NR>1 {print $1, $2}'
}


pull_image() {
    echo "Enter the image name you want to pull:"
    read image_name
    echo "Enter the version (tag) of the image (leave empty for 'latest'):"
    read version
    if [ -z "$version" ]; then
        version="latest"
    fi
    docker pull "$image_name:$version"
}


run_image() {
    echo "Enter the image name to run:"
    read image_name
    echo "Enter the version (tag) of the image (leave empty for 'latest'):"
    read version
    if [ -z "$version" ]; then
        version="latest"
    fi
    echo "Enter a name for the container (optional, press Enter to skip):"
    read container_name
    if [ -z "$container_name" ]; then
        docker run -d "$image_name:$version"
    else
        docker run -d --name "$container_name" "$image_name:$version"
    fi
    echo "Container is running!"
    docker ps --filter "ancestor=$image_name:$version"
}


run_mysql_container() {
    echo "Running a MySQL Container"
    echo "Enter a name for the MySQL container (optional, press Enter to skip):"
    read container_name
    if [ -z "$container_name" ]; then
        container_name="mysql-container"
    fi
    echo "Enter the root password for MySQL (default: rootpassword):"
    read root_password
    if [ -z "$root_password" ]; then
        root_password="rootpassword"
    fi
    echo "Enter the database name to create (default: mydatabase):"
    read database_name
    if [ -z "$database_name" ]; then
        database_name="mydatabase"
    fi
    echo "Enter the MySQL username (default: myuser):"
    read user_name
    if [ -z "$user_name" ]; then
        user_name="myuser"
    fi
    echo "Enter the MySQL password for the user (default: mypassword):"
    read user_password
    if [ -z "$user_password" ]; then
        user_password="mypassword"
    fi

    docker run -d --name "$container_name" \
        -e MYSQL_ROOT_PASSWORD="$root_password" \
        -e MYSQL_DATABASE="$database_name" \
        -e MYSQL_USER="$user_name" \
        -e MYSQL_PASSWORD="$user_password" \
        -p 3306:3306 mysql:latest

    echo "MySQL container '$container_name' is running with the following settings:"
    echo "Root Password: $root_password"
    echo "Database Name: $database_name"
    echo "MySQL Username: $user_name"
    echo "MySQL User Password: $user_password"
    docker ps --filter "name=$container_name"
}


stop_container() {
    echo "Enter the container name or ID to stop:"
    read container_name
    docker stop "$container_name"
    echo "Container $container_name stopped!"
}


remove_container() {
    echo "Enter the container name or ID to remove:"
    read container_name
    docker rm "$container_name"
    echo "Container $container_name removed!"
}


view_running_containers() {
    echo "Running Docker Containers:"
    docker ps
}


remove_image() {
    echo "Enter the image name (and version if needed) to remove:"
    read image_name
    docker rmi "$image_name"
    echo "Image $image_name removed!"
}


while true; do
    echo """
    Press 1: See available images
    Press 2: Pull an image
    Press 3: Run an image
    Press 4: Run a MySQL container
    Press 5: Stop a container
    Press 6: Remove a container
    Press 7: View running containers
    Press 8: Remove an image
    Press 9: Exit
    """
    read -p "Enter your choice: " choice

    case $choice in
        1)
            show_images
            ;;
        2)
            pull_image
            ;;
        3)
            run_image
            ;;
        4)
            run_mysql_container
            ;;
        5)
            stop_container
            ;;
        6)
            remove_container
            ;;
        7)
            view_running_containers
            ;;
        8)
            remove_image
            ;;
        9)
            echo "Exiting the Docker Management Tool."
            break
            ;;
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done

