import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    var viewModel: ViewModel! {
        didSet {
            summaryLabel?.text = viewModel.summary
            temperatureLabel?.text = String(viewModel.temperature)
        }
    }
}
