//
//  MarketListJson.swift
//  Green4all
//
//  Created by yoko on 23/03/2021.
//

import SwiftUI
import Charts

struct MarketListJson: View {

    @StateObject var stockGRNB = StockData(stockSymbol: "GRNB")
    @StateObject var stockMGGAX = StockData(stockSymbol: "MGGAX")
    @StateObject var stockCGAFX = StockData(stockSymbol: "CGAFX")
    @StateObject var stockBGRN = StockData(stockSymbol: "BGRN")
    @StateObject var stockIQQHDE = StockData(stockSymbol: "IQQH.DE")
    @StateObject var stockQCLN = StockData(stockSymbol: "QCLN")
    @StateObject var stockPBW =  StockData(stockSymbol: "PBW")
    @StateObject var stockAAPL = StockData(stockSymbol: "AAPL")
    @StateObject var stockIBM = StockData(stockSymbol: "IBM")
    @StateObject var stockMSFT = StockData(stockSymbol: "MSFT")
    @StateObject var stockMGGYX = StockData(stockSymbol: "MGGYX")
    @StateObject var stockECOAX = StockData(stockSymbol: "ECOAX")
    @StateObject var stockNUBD = StockData(stockSymbol: "NUBD")
    
    
    
    //@EnvironmentObject var modelData: ModelData
    @StateObject var modelData = ModelData()
    
    @State private var showFavoritesOnly = false
    
    init() {
        //UITableView.appearance().backgroundColor = uicolorBackground
        
        //let navBarAppearance = UINavigationBar.appearance()
        //navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        //navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    
    private func assign(item: String) -> StockData {
        switch(item) {
        case "GRNB": return stockGRNB
        case "MGGAX": return stockMGGAX
        case "CGAFX": return stockCGAFX
        case "BGRN": return stockBGRN
        case "IQQH.DE": return stockIQQHDE
        case "QCLN": return stockQCLN
        case "PBW": return stockPBW
        case "AAPL": return stockAAPL
        case "IBM": return stockIBM
        case "MSFT": return stockMSFT
        case "MGGYX": return stockMGGYX
        case "ECOAX": return stockECOAX
        case "NUBD": return stockNUBD
        default:
            return StockData(stockSymbol: "AAPL")
        }
    }
    
    private func lineChartEntry(item: StockData) -> [ChartDataEntry] {
        var result: [ChartDataEntry] = []
        for i in 0..<item.prices.count {
            result.append(ChartDataEntry(x: Double(i), y: item.prices[i]))
        }
        return result
    }
    
    var filteredItem: [AssetInfo] {
        modelData.assetInfos.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var searchedItem: [AssetInfo] {
        filteredItem.filter {
            searchText.isEmpty || $0.symbol.localizedStandardContains(searchText) || $0.company.localizedStandardContains(searchText)
        }
    }
    
    @State var searchText: String = ""

    
    var body: some View {
        NavigationView {
        //ZStack {
        //    colorBackground
        //        .ignoresSafeArea()

            VStack(alignment: .leading) {
                // SearchBar
                SearchBarYoko(searchText: $searchText)
                
                Text(assign(item: modelData.assetInfos[0].symbol).lastRefreshed).padding()
                //Text(now, style: .date).padding().environment(\.locale, Locale(identifier: "fr"))
                
                Toggle(isOn: $showFavoritesOnly) {
                    //Text("Favorites only")
                    Text("Mes favoris")
                }
                .padding(.horizontal)
                
                
                ScrollView {
                    //ForEach(searchedItem.indices) {index in
                    ForEach(searchedItem) { element in
                        
                        //ForEach(modelData.assetInfos) { element in
                    //ForEach(filteredItem) { element in
                        NavigationLink( destination:
                            MarketDetailJson(stockGRNB: stockGRNB, stockMGGAX: stockMGGAX, stockCGAFX: stockCGAFX, stockBGRN: stockBGRN, stockIQQHDE: stockIQQHDE, stockQCLN: stockQCLN, stockPBW: stockPBW, stockAAPL: stockAAPL, stockIBM: stockIBM, stockMSFT: stockMSFT,
                                stockMGGYX: stockMGGYX, stockECOAX: stockECOAX, stockNUBD: stockNUBD, 
                                assetInfo: element),
                            
                        label: {
                            
                            AssetDataRow(element:  element)
                                .background(colorTranparent)//(index  % 2 == 0) ? colorTranparent : colorTranparentMedium)//.listRowBackground((index  % 2 == 0) ? Color(.systemBlue) : Color(.red))
                            
                        })//.listRowBackground((index  % 2 == 0) ? Color(.systemBlue) : Color(.red))
                    }.buttonStyle(PlainButtonStyle()).padding(.horizontal)
                    }
                }
        //} //Zstack end
        
        .navigationBarTitle(Text("Marché vert"))
        
        //.foregroundColor(.white)

        }
        //.accentColor(.white)
        .environmentObject(modelData)
    }
}

struct MarketListJson_Previews: PreviewProvider {
    static var previews: some View {
        MarketListJson().environmentObject(ModelData()).environmentObject(StockData(stockSymbol: ""))
            .environment(\.locale, Locale(identifier: "fr"))
    }
}

extension MarketListJson {
    private func AssetDataRow(element: AssetInfo) -> some View {
        //@EnvironmentObject let item: AssetInfo
        
        //let myStock = stock(item: element.symbol)
        
        return
         
            HStack{
            VStack(alignment: .leading) {
                Text(element.symbol).font(.title2).fontWeight(.bold)
                Text(element.company).foregroundColor(colorForeGroundGreenDark)
                //Text(greenFinanceCollections[element.symbol]?.assetInfo.company ?? "")
            }
            
            Spacer()
                /* demo view with card Line chart View by "import SwiftUICharts" package ChartView */
                /*
                LineView2(
                    data: assign(item: "\(element.symbol)").prices,
                        //stockIBM.prices,
                    title: element.symbol,
                    price: "\(assign(item: "\(element.symbol)").currentPrice) USD")//"\(stockAAPL.currentPrice) USD")
                //.frame(width: 300, height: 250)
                //.background(Color.white)
                 */
                
                Line(entries: lineChartEntry(item: assign(item: element.symbol)), chartName: "\(element.symbol) close")
            
            Spacer()
            
            VStack(alignment: .trailing) {
                //Text("stocks.close, specifier: "%.2f")")
                //stockData.last?.value.close ?? "..."
                //Text("\(Double(stockAAPL.close) ?? 0.0 , specifier: "%.2f")")
                Text("\(Double(assign(item: "\(element.symbol)").close) ?? 0.0, specifier: "%.2f")")
                change(element: element)
            }

                if element.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }

            Text(">")
            //Image(systemName: "arrowtriangle.right")

        }.padding(.all, 5.0)
            
    }
}

extension MarketListJson {
    private func change(element: AssetInfo) -> some View {
        
        let open = Double(assign(item: element.symbol).open) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let currentPrice = Double(assign(item: element.symbol).currentPrice) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let close = Double(assign(item: element.symbol).close) ?? 0.0//Double(stockAAPL.close) ?? 0
        let priceChange = currentPrice - open
        let percentChange = priceChange / currentPrice * 100
        
    let colorChange = priceChange >= 0 ? Color.green : Color.red
    
    return
    
    Text("\(percentChange, specifier: "%.2f")%").background(colorChange)

    }
}
