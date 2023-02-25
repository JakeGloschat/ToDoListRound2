//
//  Task.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import Foundation

class Task: Codable {
    let taskName: String
    var isComplete: Bool
    let uuid: UUID
    
    init(taskName: String, isComplete: Bool = false, uuid: UUID = UUID()) {
        self.taskName = taskName
        self.isComplete = isComplete
        self.uuid = uuid
    }
}

// MARK: - Extension

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}
