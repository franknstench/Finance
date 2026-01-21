import SwiftUI

struct ContentView: View {
    // We’ll use this array to show stocks (add real data fetching later)
    @State private var stocks: [Stock] = []
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    // Placeholder: Later will fetch stocks from the API
                    stocks = Stock.sampleStocks()
                }) {
                    Text("Fetch Stocks")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                List(stocks) { stock in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(stock.symbol)
                                .font(.headline)
                            Text("Open: \(stock.open, specifier: \"%.2f\") | Prev Close: \(stock.previousClose, specifier: \"%.2f\")")
                                .font(.subheadline)
                        }
                        Spacer()
                        if stock.isFlagged {
                            Image(systemName: "flag.fill")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Every-Other-Day Trading")
        }
    }
}