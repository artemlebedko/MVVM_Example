import UIKit

class ViewController: UIViewController {
    
    private let cellIdentifier = "Cell"
    private var fileData = [ViewModel]()
    
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

            self.fileData = models?.daily.data.map({return ViewModel(model: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomCell
        let viewModel = fileData[indexPath.row]
        cell.summaryLabel.text = viewModel.summary
        cell.temperatureLabel.text = "Температура: " + String(viewModel.temperature) + "°"
        cell.timeLabel.text = TimeService.shared.transform(viewModel.time)
        return cell
    }
}
