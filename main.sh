#!/bin/bash

# task associative array for storing tasks
declare -A taskAssociative

# Infinite loop to keep asking for input until user chooses to quit
while true; do
    # Display the menu options
    echo -e "\n1. Add a new task"
    echo "2. Update a task"
    echo "3. Delete a task"
    echo "4. View all tasks"
    echo "5. Quit"

    # Prompt the user for choice
    echo "Enter choice: "
    read choice

    # Handle user input using a case statement
    case "$choice" in
        1)  # Add a new task
            echo "Enter task name: "
            read taskName
            echo "Enter task description: "
            read taskDescription
            taskAssociative["$taskName"]="$taskDescription"
            echo "Task added successfully!"
            ;;
        2)  # Update a task
            echo "Enter the task name to update: "
            read nameToUpdate
            if [[ -n "${taskAssociative[$nameToUpdate]}" ]]; then
                echo "Enter new task description: "
                read newDescription
                taskAssociative["$nameToUpdate"]="$newDescription"
                echo "Task updated successfully!"
            else
                echo "Task not found!"
            fi
            ;;
        3)  # Delete a task
            echo "Enter the task name to delete: "
            read nameToDelete
            if [[ -n "${taskAssociative[$nameToDelete]}" ]]; then
                unset taskAssociative["$nameToDelete"]
                echo "Task deleted successfully!"
            else
                echo "Task not found!"
            fi
            ;;
        4)  # View all tasks
            if [ ${#taskAssociative[@]} -eq 0 ]; then
                echo "No tasks available!"
            else
                echo "Viewing all tasks: "
                for taskName in "${!taskAssociative[@]}"; do
                    echo "Task: $taskName - Description: ${taskAssociative[$taskName]}"
                done
            fi
            ;;
        5)  # Quit the program
            echo "Exiting program."
            break
            ;;
        *)  # Invalid option
            echo "Invalid choice, please try again."
            ;;
    esac
done

