//
//  GoalListTableViewController.swift
//  ToDoListRound2
//
//  Created by Jake Gloschat on 2/24/23.
//

import UIKit

class GoalListTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var newGoalTextField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    // MARK: - Properties
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GoalController.shared.goals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalListTableViewCell else { return UITableViewCell() }
        
        let goal = GoalController.shared.goals[indexPath.row]
        cell.goal = goal
        cell.delegate = self
        
        return cell
    }

 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }    
    }

    // MARK: - Helper
    func updateUI() {
        self.tableView.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toTaskList",
              let destinationVC = segue.destination as? TaskListTableViewController,
              let indexPath = tableView.indexPathForSelectedRow else { return }
        let goal = GoalController.shared.goals[indexPath.row]
        destinationVC.goal = goal
            }

    // MARK: - Actions
    
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let goalName = newGoalTextField.text,
              !goalName.isEmpty else { return }
        GoalController.shared.createGoal(name: goalName)
        updateUI()
    }
}

extension GoalListTableViewController: GoalListTableViewCellDelegate {
    func isCompleteButtonWasTapped(_ cell: GoalListTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let goal = GoalController.shared.goals[indexPath.row]
        GoalController.shared.toggleIsComplete(goals: goal)
        cell.goal = goal
    }
}
