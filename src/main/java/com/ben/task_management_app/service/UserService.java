/**
 * 
 */
package com.ben.task_management_app.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.ben.task_management_app.model.User;
import com.ben.task_management_app.repository.UserRepository;

/**
 * 
 */
@Service
public class UserService {

	private final UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		super();
		this.userRepository = userRepository;
	}

	// Retrieve all users
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	// find user by ID
	public User getUserById(Integer id) {
		return userRepository.findById(id).orElseThrow(() -> new RuntimeException("User not found with id: " + id));
	}

	// create or save new user
	public User createUser(User user) {
		return userRepository.save(user);
	}

	// delete an user
	public void deleteUser(Integer id) {
		if (!userRepository.existsById(id)) {
			throw new RuntimeException("User not found with Id :" + id);
		}
		userRepository.deleteById(id);
	}

	public Optional<User> getUserByName(String name) {
		return userRepository.findByUserName(name); // <-- Update this call to match
	}
}
