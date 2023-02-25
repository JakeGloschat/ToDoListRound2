//
//  TaskListTableViewController.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Properties
    var goal: Goal?
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goal?.tasks.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskListTableViewCell,
              let goal = goal?.tasks[indexPath.row] else { return UITableViewCell() }
        
        cell.updateViews(task: goal)
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonWasTapped(_ sender: Any) {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty,
              let goal = goal else { return }
        TaskController.createTask(goal: goal, taskName: taskName)
        self.tableView.reloadData()
    }
}

// MARK: - Exensions
extension TaskListTableViewController: TaskListTableViewCellDelegate {
    func isCompleteButtonwasTapped(_ cell: TaskListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell),
              let task = goal?.tasks[indexPath.row] else { return }
        TaskController.toggleIsComplete(task: task)
        cell.updateViews(task: task)
        checkAllComplete()
    }
    
    func checkAllComplete() {
        guard let goal = goal else { return }
        for task in goal.tasks {
            if task.isComplete == false { return }
        }
        presentDeleteListAlertController()
    }
    func presentDeleteListAlertController() {
        let alertController = UIAlertController(title: "Delete List", message: "Delete Goal List?", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(dismissAction)
        let confirmAction = UIAlertAction(title: "Delete List", style: .destructive) { _ in
            guard let goal = self.goal else { return }
            GoalController.shared.deleteGoal(goal: goal)
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
}
