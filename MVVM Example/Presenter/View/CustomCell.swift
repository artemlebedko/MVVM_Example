import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var viewModel: Data! {
        didSet {
            summaryLabel?.text = viewModel.summary
            temperatureLabel?.text = String(viewModel.temperatureHigh)
            timeLabel?.text = String(viewModel.time)
        }
    }
}
