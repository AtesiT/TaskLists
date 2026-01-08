import UIKit

final class TableViewController: UITableViewController {
    
    let countLinesData = ["1","2"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countLinesData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let theData = countLinesData[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = theData
        
        cell.contentConfiguration = content
        return cell
    }
}
