//
//  Goal.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import Foundation

class Goal: Codable {
    let goalName: String
    var tasks: [Task]
    var isComplete: Bool
    let uuid: UUID
    
    init(goalName: String, tasks: [Task] = [], isComplete: Bool = false, uuid: UUID = UUID()) {
        self.goalName = goalName
        self.tasks = tasks
        self.isComplete = isComplete
        self.uuid = uuid
    }
}

// MARK: - Extension
extension Goal: Equatable {
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return rhs.uuid == lhs.uuid
    }
}
