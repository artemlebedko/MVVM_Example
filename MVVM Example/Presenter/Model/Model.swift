struct Model: Decodable {
    let timezone: String
    let currently: Currently
    let daily: Daily
}

struct Currently: Decodable {
    let summary: String
    let temperature: Double
    let time: Int
}

struct Daily: Decodable {
   let data: [Data]
}

struct Data: Decodable {
    let summary: String
    let temperatureHigh: Double
    let time: Int
}


