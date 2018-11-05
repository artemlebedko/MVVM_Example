import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var viewModel:  ViewModel! {
        didSet {
            summaryLabel?.text = viewModel.summary
            temperatureLabel?.text = "Температура: " + String(viewModel.temperature) + "°"
            timeLabel?.text = TimeService.shared.transform(viewModel.time)
        }
    }
}
