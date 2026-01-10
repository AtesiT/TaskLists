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
        navigationItem.rightBarButtonItems = [addButton, editButtonItem]
    }

    // MARK: - Table view data source
    
    
    //  Для того, чтобы отобразить только две секции Current Tasks and Completed Tasks
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    //  Задаём количество ячеек в одной из секций
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? currentTasks.count : completedTasks.count
    }

    //  Задаём заголовок каждой ячейке
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "CURRENT TASKS" : "COMPLETED TASKS"
    }
    
    //  Заполняем ячейки содержимым
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let task = indexPath.section == 0 ? currentTasks[indexPath.row] : completedTasks[indexPath.row]
        
        content.text = task.title
        content.secondaryText = task.note
        
        cell.contentConfiguration = content
        return cell
    }
    
    
    @objc private func addButtonPressed() {
        
    }
}

//#Preview {
//    TasksTableViewController()
//}
