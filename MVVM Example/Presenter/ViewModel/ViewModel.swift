struct ViewModel {
    let summary: String
    let temperature: Double
    let time: Int
    
    init(model: Data) {
        self.summary = model.summary
        self.temperature = model.temperatureHigh
        self.time = model.time
    }
}
