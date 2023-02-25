//
//  GoalController.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import Foundation

class GoalController {
    
    // MARK: - Properties
    static let shared = GoalController()
    var goals: [Goal] = []
    
    // MARK: - Functions
    func createGoal(name: String) {
        let goal = Goal(goalName: name)
        goals.append(goal)
    }
    
    func deleteGoal(goal: Goal) {
        guard let index = goals.firstIndex(of: goal) else { return }
        goals.remove(at: index)
    }
    
    func toggleIsComplete(goals: Goal) {
        goals.isComplete.toggle()
    }
} // End of Class
