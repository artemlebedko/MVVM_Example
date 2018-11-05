import UIKit

class ViewController: UIViewController {
    
    private let cellIdentifier = "Cell"
    private var viewModels = [ViewModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        downloadData()
    }
    
    fileprivate func downloadData() {
        DownloadService.shared.fetchRequest { (models, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.viewModels = models?.daily.data.map({return ViewModel(model: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        let viewModel = viewModels[indexPath.row]
        cell.viewModel = viewModel
        return cell
    }
}
