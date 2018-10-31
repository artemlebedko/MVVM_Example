struct Model: Decodable {
    let timezone: String
    let currently: Currently
}

struct Currently: Decodable {
    let summary: String
    let temperature: Double
    let time: Int
}
