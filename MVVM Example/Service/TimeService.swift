import Foundation

class TimeService {
    private init() {}
    static let shared = TimeService()
    
    func transform(_ unixTime: Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(unixTime))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        
        return dateString
    }
}
