import Foundation

struct Stock: Identifiable {
    let id = UUID()
    let symbol: String
    let open: Double
    let previousClose: Double

    // Flag as 'substantially higher' (change this threshold as you wish)
    var isFlagged: Bool {
        (open - previousClose) / previousClose > 0.05 // >5% higher
    }
}

// For beginner testing/demo
extension Stock {
    static func sampleStocks() -> [Stock] {
        [
            Stock(symbol: "AAPL", open: 185.30, previousClose: 176.54),
            Stock(symbol: "GOOG", open: 2834.00, previousClose: 2810.25),
            Stock(symbol: "TSLA", open: 749.50, previousClose: 699.80)
        ]
    }
}