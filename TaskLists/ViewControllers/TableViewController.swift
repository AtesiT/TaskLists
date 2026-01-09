import UIKit

final class TableViewController: UITableViewController {
    
    private var taskLists: [TaskList]!
    private let storageManager = StorageManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonPressed)
        )
        
        navigationItem.rightBarButtonItem = addButton
        navigationItem.leftBarButtonItem = editButtonItem
        
        taskLists = storageManager.fetchTrackList()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let theData = taskLists[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = theData.title
        content.secondaryText = theData.tasks.count.formatted()
        
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let taskList = taskLists[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [unowned self] _, _, _ in
            storageManager.delete(taskList)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { [unowned self] _, _, isDone in
//            showAlert(title: <#T##String#>) {
//                
//            }
            isDone(true)
        }
        
        let doneAction = UIContextualAction(style: .normal, title: "Done") { [unowned self] _, _, isDone in
            storageManager.done(taskList)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            isDone(true)
        }
        
        editAction.backgroundColor = .systemOrange
        doneAction.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction, doneAction])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let tasksVC = segue.destination as? TasksTableViewController else {return}
        let taskList = taskLists[indexPath.row]
        tasksVC.taskList = taskList
    }
    
    @IBAction func sortList(_ sender: UISegmentedControl) {
        
    }
    
    @objc private func addButtonPressed() {
        print("Check")
    }
    
    
}

extension TableViewController {
    private func showAlert(with taskList: TaskList? = nil, completion: (() -> Void)? = nil) {
        let alertBuilder = AlertControllerBuilder(
            title: taskList != nil ? "Edit List" : "New List",
            message: "Please set title for a new task list"
        )
        
        alertBuilder
            .setTextField(withPlaceholder: "List Title", andText: taskList?.title)
            .addAction(title: taskList != nil ? "Update List" : "Save List", style: .default) { [unowned self] newValue, _ in
                if let taskList, let completion {
                    storageManager.edit(taskList, newValue: newValue)
                    completion()
                    return
                }
                createTaskList(withTitle: newValue)
            }
            .addAction(title: "Cancel", style: .destructive)
        
        let alertController = alertBuilder.build()
        present(alertController, animated: true)
    }
    
    private func createTaskList(withTitle title: String) {
        
    }
//    private func showAlerts(title: String, message: String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//        alert.addAction(okAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true)
//    }
}
