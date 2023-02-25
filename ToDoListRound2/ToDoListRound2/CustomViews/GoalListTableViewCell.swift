//
//  GoalListTableViewCell.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import UIKit

protocol GoalListTableViewCellDelegate: AnyObject {
    func isCompleteButtonWasTapped(_ cell: GoalListTableViewCell)
}

class GoalListTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var goalNameLabel: UILabel!
    @IBOutlet weak var taskCountLabel: UILabel!
    
    // MARK: - Properties
    weak var delegate: GoalListTableViewCellDelegate?
    var goal: Goal? {
        didSet {
            updateViews()
        }
    }
    // MARK: - Functions
    func updateViews() {
        guard let goal = goal else { return }
        goalNameLabel.text = goal.goalName
        taskCountLabel.text = String(goal.tasks.count)
        
        let imageName = goal.isComplete ? "checkmark.seal.fill" : "checkmark.seal"
        isCompleteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    // MARK: - Actions
    @IBAction func isCompleteButtonTapped(_ sender: Any) {
        delegate?.isCompleteButtonWasTapped(self)
    }
}
