//
//  CombineJSONStockPrice.swift
//  Green4all
//
//  Created by yoko on 23/03/2021.
//

import Foundation
import Combine

class StockData : ObservableObject {
    
    @Published var prices = [Double]()
    
    @Published var currentPrice = "...."
    @Published var open = ""
    @Published var close = ""
    @Published var high = ""
    @Published var low = ""
    @Published var volume = ""

    @Published var lastRefreshed = ""  // added by yoko
    @Published var timeZone = ""
    @Published var dates = [String]()
    @Published var volumes = [(String, Int)]()//[Dictionary<String, Int>]()
    
    
    //var stockSymbol: String = ""
    
    private var stockFunction = "TIME_SERIES_DAILY"
    var stockSymbol = ""
    /*
    private var apiKey = "MyApiKey"
    
    var urlBase = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=AAPL&apikey=MyApiKey&datatype=json"
    */
    
    var cancellable : Set<AnyCancellable> = Set()
    
    init(stockSymbol: String) {
        self.stockSymbol = stockSymbol
        fetchStockPrice()
    }
    
    func fetchStockPrice(){

        var stockPrices = [Double]()
        var stockDates = [String]()
        var stockVolumes = [(String, Int)]()
        
        let lastRefreshed = "2021-03-22"
        let myStockDataJsonFile = stockSymbol + lastRefreshed + ".json"
        print(myStockDataJsonFile)
        
        //let myStockData = Bundle.main.decode("IBM2021-03-22.json")
        let value = Bundle.main.decode(myStockDataJsonFile)
        
        
        print("load completed. value.timeSeriesDaily.count = ")
        //print(value.timeSeriesDaily?.count ?? 0) //IBMstockData.timeSeriesDaily?[lastRefreshed]?.open ?? "none")
        //print(value.metaData.symbol)
        //print(value.metaData.lastRefreshed)
        
            let orderedDates =  value.timeSeriesDaily?.sorted{
                guard let d1 = $0.key.stringDate, let d2 = $1.key.stringDate else { return false }
                return d1 < d2
            }
            
            guard let stockData = orderedDates else {return}
            
        //print(stockData)
            for (day, stoc) in stockData{
                if let stock = Double(stoc.close) {
                    
                        if let vol = Int(stoc.volume) {
                    if stock > 0.0{
                        stockPrices.append(stock)
                        stockDates.append(day)
                        stockVolumes.append( (day, vol) )
                    }}
                }
            }
        print(stockVolumes[0].0, stockVolumes[0].1)
            DispatchQueue.main.async{
                self.prices = stockPrices
                
                self.currentPrice = stockData.last?.value.close ?? "..."
                self.open = stockData.last?.value.open ?? "..."
                self.close = stockData.last?.value.close ?? "..."
                self.high = stockData.last?.value.high ?? "..."
                self.low = stockData.last?.value.low ?? "..."
                self.volume = stockData.last?.value.volume ?? "..."
                
                self.lastRefreshed = value.metaData.lastRefreshed
                self.timeZone = value.metaData.timeZone
                self.dates = stockDates
                self.volumes = stockVolumes
            }
        /*})*/
            //.store(in: &cancellable)
        
    }
}

