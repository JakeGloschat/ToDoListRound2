//
//  TaskListTableViewCell.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import UIKit

protocol TaskListTableViewCellDelegate: AnyObject {
    func isCompleteButtonwasTapped(_ cell: TaskListTableViewCell)
}
class TaskListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    // MARK: - Properties
    weak var delegate: TaskListTableViewCellDelegate?
    
    // MARK: - Functions
    func updateViews(task: Task) {
        taskNameLabel.text = task.taskName
        
        let imageName = task.isComplete ? "checkmark.seal.fill" : "checkmark.seal"
        isCompleteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func isCompleteButtonWasTapped(_ sender: Any) {
        delegate?.isCompleteButtonwasTapped(self)
    }
} // End of Class
