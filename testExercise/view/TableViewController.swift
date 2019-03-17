import UIKit

class TableViewController: UITableViewController {
    
    // Refresh page
    @IBAction func refreshControlAction(_ sender: Any) {
        loadContent {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.refreshControl?.endRefreshing()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // If no new data.json, will be load old data to TableView
        // When new data.json will load it will refresh page with new data
        loadContent {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewModel().numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        let cellViewModel = TableViewModel().cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellViewModel = TableViewModel().cellViewModel(forIndexPath: indexPath)
        guard let cell = cellViewModel else { return }
        
        var messageForAlert = "title: \(cell.title)"
        if cell.name != "" {
            messageForAlert += "\nName: \(cell.name)"
        }
        if cell.imageData != nil {
            messageForAlert += "\nWith picture"
        }
        
        let alertController = UIAlertController(title: "info", message: messageForAlert, preferredStyle: .actionSheet)
        let cancelButton = UIAlertAction(title: "cancel", style: .default) { (action) in
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
    }
}
