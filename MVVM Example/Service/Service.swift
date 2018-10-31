import Foundation

class Service {
    private init() {}
    static let shared = Service()
    
    func fetchRequest(completion: @escaping (Model?, Error?) -> ()){
        let urlString = "https://api.darksky.net/forecast/a9cc91c8fab9839f51dbd2397f9e6470/55.45,37.37?lang=ru&units=auto"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(Model.self, from: data)
                
                DispatchQueue.main.async {
                    completion(result, nil)
                }
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            }.resume()
    }
}
