//
//  CombineURLSessionStockPrice.swift
//  ProtocolAFPEexample
//
//  Created by yoko on 11/03/2021.
//

import Foundation
import Combine

class Stocks : ObservableObject {  
    
    @Published var prices = [Double]()
    @Published var currentPrice = "...."
    @Published var open = ""
    @Published var close = ""
    @Published var high = ""
    @Published var low = ""
    @Published var volume = ""

    //var stockSymbol: String = ""
    
    private var stockFunction = "TIME_SERIES_DAILY"
    var stockSymbol = ""
    /*
    private var apiKey = "2OZPW2NW0AT07VNL"
    var urlBase = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=2OZPW2NW0AT07VNL&datatype=json"
    */
    
    var cancellable : Set<AnyCancellable> = Set()
    
    init(stockSymbol: String) {
        self.stockSymbol = stockSymbol
        fetchStockPrice()
    }
  
    private var apiKey: String {
      get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "keys", ofType: "plist") else {
          fatalError("Couldn't find file 'keys.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "apiKey") as? String else {
          fatalError("Couldn't find key 'apiKey' in 'keys.plist'.")
        }
        return value
      }
    }
    
    func fetchStockPrice(){
        
        let urlBase =
            "https://www.alphavantage.co/query?function=\(stockFunction)&symbol=\(stockSymbol)&apikey=\(apiKey)&datatype=json"
        
        print(urlBase)

        URLSession.shared.dataTaskPublisher(for: URL(string: "\(urlBase)")!)
            .map{output in
                
                return output.data
        }
        .decode(type: StocksDaily.self, decoder: JSONDecoder())
        .sink(receiveCompletion: {_ in
            print("completed")
        }, receiveValue: { value in

            var stockPrices = [Double]()
            
            let orderedDates =  value.timeSeriesDaily?.sorted{
                guard let d1 = $0.key.stringDate, let d2 = $1.key.stringDate else { return false }
                return d1 < d2
            }
            
            guard let stockData = orderedDates else {return}
            
            for (_, stock) in stockData{
                if let stock = Double(stock.close){
                    if stock > 0.0{
                        stockPrices.append(stock)
                    }
                }
            }
            
            DispatchQueue.main.async{
                self.prices = stockPrices
                self.currentPrice = stockData.last?.value.close ?? "..."
                self.open = stockData.last?.value.open ?? "..."
                self.close = stockData.last?.value.close ?? "..."
                self.high = stockData.last?.value.high ?? "..."
                self.low = stockData.last?.value.low ?? "..."
                self.volume = stockData.last?.value.volume ?? "..."
            }
        })
            .store(in: &cancellable)
        
    }
}

extension String {
    static let shortDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    var stringDate: Date? {
        return String.shortDate.date(from: self)
    }
}

