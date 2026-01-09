import UIKit

final class TasksTableViewController: UITableViewController {

    var taskList: TaskList!
    
    private var currentTasks: [Task] = []
    private var completedTasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = taskList.title
        
        let addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonPressed)
        )
        navigationItem.rightBarButtonItem = [addButton, editButtonItem]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
