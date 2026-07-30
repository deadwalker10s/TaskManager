/**
 * 
 */
package com.ben.task_management_app.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ben.task_management_app.model.TaskAlert;

/**
 * 
 */
@Repository
public interface TaskAlertRepository extends JpaRepository<TaskAlert, Integer> {

}
