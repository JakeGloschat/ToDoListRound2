//
//  TaskController.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import Foundation

class TaskController {
    
    // MARK: - Functions
    static func createTask(goal: Goal, taskName: String) {
       let task = Task(taskName: taskName)
        goal.tasks.append(task)
    }
    
    static func deleteTask(task: Task, in goal: Goal) {
        guard let index = goal.tasks.firstIndex(of: task) else { return }
        goal.tasks.remove(at: index)
    }
    
    static func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
    }
} // End of Class
