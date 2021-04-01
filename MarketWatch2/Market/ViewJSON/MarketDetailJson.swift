//
//  MarketDetailJson.swift
//  Green4all
//
//  Created by vincent schmitt on 23/03/2021.
//

import SwiftUI
//import SwiftUICharts
import Charts

struct MarketDetailJson: View {
    
    @ObservedObject var stockGRNB: StockData
    @ObservedObject var stockMGGAX: StockData
    @ObservedObject var stockCGAFX: StockData
    @ObservedObject var stockBGRN: StockData
    @ObservedObject var stockIQQHDE: StockData
    @ObservedObject var stockQCLN: StockData
    @ObservedObject var stockPBW: StockData
    @ObservedObject var stockAAPL: StockData
    @ObservedObject var stockIBM: StockData
    @ObservedObject var stockMSFT: StockData
    @ObservedObject var stockMGGYX: StockData
    @ObservedObject var stockECOAX: StockData
    @ObservedObject var stockNUBD: StockData
    
    
    @EnvironmentObject var modelData: ModelData
    
    @State var assetInfo: AssetInfo// = aaplInfo
    
    var assetInfoIndex: Int {
            modelData.assetInfos.firstIndex(where: { $0.id == assetInfo.id })!
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
            return stockAAPL
        }
    }
    
    private func lineChartEntry(item: StockData) -> [ChartDataEntry] {
        var result: [ChartDataEntry] = []
        for i in 0..<item.prices.count {
            result.append(ChartDataEntry(x: Double(i), y: item.prices[i]))
        }
        return result
    }
    
    private func barChartEntry(item: StockData) -> [BarChartDataEntry] {
        var result: [BarChartDataEntry] = []
        for i in 0..<item.volumes.count {
            result.append(BarChartDataEntry(x: Double(i), y:  Double(item.volumes[i].1)))
        }
        return result
    }
                                    
    
    var body: some View {
        //List {
        VStack(alignment: .leading) {

                HStack {
                //Text(item.symbol).font(.title)
                    Text(assetInfo.name).font(.title2)
                    Spacer()
                    FavoriteButton(isSet: $modelData.assetInfos[assetInfoIndex].isFavorite)
                }
                HStack {
                    //Text("\(itemData.lastRefreshedTimeSeries.assetDatas[0].close, specifier: "%.2f")").font(.title)
                    Text("\(Double("\(assign(item: assetInfo.symbol).currentPrice)") ?? 0.00, specifier: "%.2f") ").font(.title)
                    Text("USD").font(.caption).baselineOffset(-10)
                    //Spacer()
                    change//(element: assetInfo)
                }

            //Text(now, style: .date).environment(\.locale, Locale(identifier: "fr"))                //.padding()
            Text(assign(item: assetInfo.symbol).lastRefreshed)

            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
                
                
            //GeometryReader{ geom in
                /*
                LineView2(data: assign(item: assetInfo.symbol).prices, title: assetInfo.symbol, price: "\(assign(item: assetInfo.symbol).currentPrice) USD")
                */
            
            //LineCharts(data: assign(item: assetInfo.symbol).prices)
            //let chartStyle = ChartStyle( backgroundColor: .yellow, accentColor: .red, gradientColor: GradientColor(start: .blue, end: .purple), textColor: .black, legendTextColor: .black, dropShadowColor: .gray)
            //BarChartView(data: ChartData(values: [("a",800.0),("b",2300.0),("c",5400.0),("d",3200.0),("e",1200.0),("f",3700.0),("g",70000.0),("h",2300.0),("i",4300.0)]), title: "Title", style: ChartStyle(backgroundColor: .white, accentColor: .black, gradientColor: GradientColor(start: .blue, end: .purple), textColor: .black, legendTextColor: .gray, dropShadowColor: .pink), form: ChartForm.medium)
            //BarChartView(data: ChartData(values: [("2018 Q4",63150), ("2019 Q1",50900), ("2019 Q2",77550), ("2019 Q3",79600), ("2019 Q4",92550)]), title: "test string Int", form: ChartForm.medium)
            /* demo view with card Line chart View by "import SwiftUICharts" package ChartView */
            //LineChartView(data: assign(item: assetInfo.symbol).prices, title: assetInfo.symbol, legend: ("CurrentPrice: \(Double("\(assign(item: assetInfo.symbol).currentPrice)") ?? 0.00)"), form: ChartForm.extraLarge)
            //LineView(data: assign(item: assetInfo.symbol).prices, title: assetInfo.symbol, legend: ("CurrentPrice: \(Double("\(assign(item: assetInfo.symbol).currentPrice)") ?? 0.00)"))// legend is optional, use optional .padding()
                    //.frame(minWidth: 300, idealWidth: 400, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 100, idealHeight: 260, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)  //(width: 300, height: 250,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.frame(width: geom.frame(in: .local).width , height: 250)
                    //.frame(width: .infinity, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //.padding()
                    //.background(colorTransparentClear)
            /* demo view with card Bar chart View by "import SwiftUICharts" package ChartView*/
            //BarChartView(data: ChartData(values:  assign(item: assetInfo.symbol).volumes), title: assetInfo.symbol, legend: ("CurrentVolume: \(Double("\(assign(item: assetInfo.symbol).volume)") ?? 0.00)"), form: ChartForm.extraLarge)
            /*
            LineDetail(entries: lineChartEntry(item: assign(item: assetInfo.symbol)), chartName: "\(assetInfo.symbol) close")
            */
                Combined(lineEntries: lineChartEntry(item: assign(item: assetInfo.symbol)), lineLabel: "\(assetInfo.symbol) close", barEntries: barChartEntry(item: assign(item: assetInfo.symbol)), barLabel: "\(assetInfo.symbol) volume", dayEntries: assign(item: assetInfo.symbol).dates)
                
            }
            dataListView(title: "Open", data: assign(item: assetInfo.symbol).open).listRowBackground(colorBackgroundMedium)//.foregroundColor(colorForeGroundGreenDark)
            dataListView(title: "Close", data: assign(item: assetInfo.symbol).close)
                    .listRowBackground(colorBackgroundClear)//.foregroundColor(colorForeGroundGreenDark)
            dataListView(title: "High", data: assign(item: assetInfo.symbol).high ).listRowBackground(colorBackgroundMedium)//.foregroundColor(colorForeGroundGreenDark)
            dataListView(title: "Low", data: assign(item: assetInfo.symbol).low).listRowBackground(colorBackgroundClear)//.foregroundColor(colorForeGroundGreenDark)
            dataListView(title: "Volume", data: assign(item: assetInfo.symbol).volume).listRowBackground(colorBackgroundMedium)//.foregroundColor(colorForeGroundGreenDark)

        
            //.listRowBackground(colorBackground)
            .navigationBarTitle(
                assetInfo.symbol)
            //originalTitle)
        }.padding()
        //.background(Color.green)
        //.edgesIgnoringSafeArea(.all)
        //.foregroundColor(.white)
    }
}

struct MarketDetailJson_Previews: PreviewProvider {
    static let modelData = ModelData()
    static var previews: some View {
        MarketDetailJson(stockGRNB: StockData(stockSymbol: "GRNB"),stockMGGAX: StockData(stockSymbol: "MGGAX"), stockCGAFX: StockData(stockSymbol: "CGAFX"), stockBGRN: StockData(stockSymbol: "BGRN"), stockIQQHDE: StockData(stockSymbol: "IQQH.DE"), stockQCLN: StockData(stockSymbol: "QCLN"), stockPBW: StockData(stockSymbol: "PBW"), stockAAPL: StockData(stockSymbol: "AAPL"), stockIBM: StockData(stockSymbol: "IBM"), stockMSFT: StockData(stockSymbol: "MSFT"),
                         stockMGGYX: StockData(stockSymbol: "MGGYX"), stockECOAX: StockData(stockSymbol: "ECOAX"), stockNUBD: StockData(stockSymbol: "NUBD"),
                         assetInfo: modelData.assetInfos[0]).environmentObject(modelData)
        
        
    }
}

extension MarketDetailJson {

    private var change: some View {
        let open = Double(assign(item: assetInfo.symbol).open) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let currentPrice = Double(assign(item: assetInfo.symbol).currentPrice) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let close = Double(assign(item: assetInfo.symbol).close) ?? 0.0//Double(stockAAPL.close) ?? 0
        let priceChange = currentPrice - open
        let percentChange = priceChange / currentPrice * 100
        
        let colorChange = priceChange >= 0 ? Color.green : Color.red
    
    return
        HStack {
        Spacer()
        Text("\(priceChange, specifier: "%.2f")").font(.title2).padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/).background(colorChange)
        //Spacer()
            Text("(\(percentChange, specifier: "%.2f")%)").font(.title2).background(colorChange)
        }
    }
}


extension MarketDetailJson {
    //private func dataListView(title: String, data: Double) -> some View {
    private func dataListView(title: String, data: String) -> some View {
        HStack {
            Text(title)
                //.fontWeight(.bold)
            Spacer()
                //Text("\(data, specifier: "%.2f")")
            Text("\(Double(data) ?? 0, specifier: "%.2f")")
                //.fontWeight(.bold)
        }
    }
}

/* demo with Line Chart View by "import SwiftUICharts" package ChartView
struct LineCharts:View {
    @State var data: [Double]
    var body: some View {
        VStack{
            LineChartView(data: data, title: "Title")
        }
    }
}
*/
