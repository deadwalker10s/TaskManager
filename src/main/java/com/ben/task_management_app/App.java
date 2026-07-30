package com.ben.task_management_app;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.ben.task_management_app.model.Task;
import com.ben.task_management_app.model.User;

@SpringBootApplication
public class App {
	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
		Scanner scanner = new Scanner(System.in);
		DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		int nextTaskId = 1;

		System.out.println("=== Welcome to Task Management App ===");
		System.out.println("Enter ur name ");
		String username = scanner.nextLine();

		User currentUser = new User(101, username, null);
		System.out.println("Profile for " + currentUser.getUserName());

		while (true) {
			System.out.println("\n--- MAIN MENU ---");
			System.out.println("1. View My Tasks");
			System.out.println("2. Add a New Task");
			System.out.println("3. Exit Application");
			System.out.print("Choose an option (1-3): ");
			int choice;
			try {
				choice = Integer.parseInt(scanner.nextLine());
			} catch (NumberFormatException e) {
				System.out.println("Invalid input! Please enter a number.");
				continue;
			}

			if (choice == 1) {
				// VIEW TASKS
				System.out.println("\n--- YOUR TASK LIST ---");
				if (currentUser.getTasks().isEmpty()) {
					System.out.println("Your task list is completely empty!");
				} else {
					for (Task task : currentUser.getTasks()) {
						System.out.println(task);
					}
				}

			} else if (choice == 2) {
				// ADD TASK WITH DATA VALIDATION
				System.out.println("\n--- CREATE A NEW TASK ---");

				System.out.print("Enter Title: ");
				String title = scanner.nextLine();

				System.out.print("Enter Description: ");
				String description = scanner.nextLine();

				System.out.print("Enter Priority (High/Medium/Low): ");
				String priority = scanner.nextLine();

				// Due Date input tracking with validation loop
				LocalDate dueDate = null;
				while (dueDate == null) {
					System.out.print("Enter Due Date (Format: YYYY-MM-DD): ");
					String dateInput = scanner.nextLine();

					try {
						LocalDate parsedDate = LocalDate.parse(dateInput, dateFormatter);

						// Validation check: Is the date before today?
						if (parsedDate.isBefore(LocalDate.now())) {
							System.out.println("⚠️ Error: Due date cannot be in the past! Please try again.");
						} else {
							dueDate = parsedDate; // Valid date accepted
						}
					} catch (DateTimeParseException e) {
						System.out.println("⚠️ Error: Invalid date format. Use exact YYYY-MM-DD (e.g., 2026-08-15).");
					}
				}

				// Construct and add the task directly to the user profile
				Task newTask = new Task(nextTaskId++, title, description, priority, dueDate, false);
				System.out.println("\n NewTask : " + newTask);
				currentUser.addTask(newTask);
				System.out.println("\n✅ Task added successfully to your profile!");

			} else if (choice == 3) {
				System.out.println("Exiting application... Goodbye, " + currentUser.getUserName() + "!");
				break;
			} else {
				System.out.println("Invalid menu choice. Please select option 1, 2, or 3.");
			}
		}
		scanner.close();
	}
}
