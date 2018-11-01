struct ViewModel {
    let summary: String
    let temperature: Double
    let time: Int
    
    init(model: Model) {
        self.summary = model.currently.summary
        self.temperature = model.currently.temperature
        self.time = model.currently.time
    }
}
