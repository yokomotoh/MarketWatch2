//
//  MarketDetail.swift
//  Green4all
//
//  Created by yoko on 22/03/2021.
//

import SwiftUI

struct MarketDetail: View {
    
    @ObservedObject var stockAAPL = Stocks(stockSymbol: "AAPL")
    @ObservedObject var stockIBM = Stocks(stockSymbol: "IBM")
    @ObservedObject var stockMSFT = Stocks(stockSymbol: "MSFT")
    @EnvironmentObject var modelData: ModelData
    
    @State var assetInfo: AssetInfo// = aaplInfo
    
    var assetInfoIndex: Int {
            modelData.assetInfos.firstIndex(where: { $0.id == assetInfo.id })!
        }
    
    private func assign(item: String) -> Stocks {
        switch(item) {
        case "AAPL": return stockAAPL
        case "IBM": return stockIBM
        case "MSFT": return stockMSFT
        default:
            return Stocks(stockSymbol: "")
        }
    }
    
    
    var body: some View {
        List {
            //VStack(alignment: .leading) {
            Group {
                HStack {
                //Text(item.symbol).font(.title)
                    Text(assetInfo.name).font(.title2)
                    Spacer()
                    FavoriteButton(isSet: $modelData.assetInfos[assetInfoIndex].isFavorite)
                }
                HStack {
                    //Text("\(itemData.lastRefreshedTimeSeries.assetDatas[0].close, specifier: "%.2f")").font(.title)
                    Text("\(Double("\(assign(item: assetInfo.symbol).currentPrice)") ?? 0.00, specifier: "%.2f") USD").font(.title)
                    //Spacer()
                    change//(element: assetInfo)
                    
                }
                //shortDate(now)
            
            //graph
            //GeometryReader{ geom in
                /* demo view with card Line chart View by "import SwiftUICharts" package ChartView */
/*
                LineView2(data: assign(item: assetInfo.symbol).prices, title: assetInfo.symbol, price: "\(assign(item: assetInfo.symbol).currentPrice) USD")
                    .frame(minWidth: 300, idealWidth: 400, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 100, idealHeight: 260, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)  //(width: 300, height: 250,  alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    //(width: geom.frame(in: .local).width , height: 250)
                    .padding()
                    .background(colorTransparentClear)
 */
            //}
            //datas
                /*
                dataListView(title: "High", data: itemData.lastRefreshedTimeSeries.assetDatas[0].high )
                dataListView(title: "Low", data: itemData.lastRefreshedTimeSeries.assetDatas[0].low)
                */
                dataListView(title: "Open", data: assign(item: assetInfo.symbol).open).listRowBackground(colorBackgroundMedium).foregroundColor(colorForeGroundGreenDark)
                dataListView(title: "Close", data: assign(item: assetInfo.symbol).close)
                    .listRowBackground(colorBackgroundClear).foregroundColor(colorForeGroundGreenDark)
                dataListView(title: "High", data: assign(item: assetInfo.symbol).high ).listRowBackground(colorBackgroundMedium).foregroundColor(colorForeGroundGreenDark)
                dataListView(title: "Low", data: assign(item: assetInfo.symbol).low).listRowBackground(colorBackgroundClear).foregroundColor(colorForeGroundGreenDark)
                dataListView(title: "Volume", data: assign(item: assetInfo.symbol).volume).listRowBackground(colorBackgroundMedium).foregroundColor(colorForeGroundGreenDark)
                
            }
            .listRowBackground(
                colorBackground
            )
        .navigationBarTitle(
            assetInfo.symbol
            //originalTitle
        )
        
    }
    .background(Color.green)
    .edgesIgnoringSafeArea(.all)
    .foregroundColor(.white)
    
    }
}

struct MarketDetail_Previews: PreviewProvider {
    
    //static var assetInfos = ModelData().assetInfos
    static let modelData = ModelData()
    
    static var previews: some View {
        MarketDetail(assetInfo: modelData.assetInfos[0]).environmentObject(ModelData())
    }
}

extension MarketDetail {
/*    private var change : some View {
        
        let open = Double(stocks.open)
        let close = Double(stocks.close) ?? 0
        let priceChange = open ?? 0 - close
        let percentChange = priceChange / (open ?? 0) * 100
    let colorChange = priceChange > 0 ? Color.green : Color.red
        
    return
            
    HStack {
        Spacer()
        Text("\(priceChange, specifier: "%.2f")").font(.title2).padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/).background(colorChange)
        Spacer()
        Text("(\(percentChange, specifier: "%.2f")%)").font(.title2).padding(.horizontal).background(colorChange)
    }
    }
*/
    private var change: some View {
        //let open = Double(assign(item: element.symbol).open) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let currentPrice = Double(assign(item: assetInfo.symbol).currentPrice) ?? 0.0 //Double(stockAAPL.open) ?? 0
        let close = Double(assign(item: assetInfo.symbol).close) ?? 0.0//Double(stockAAPL.close) ?? 0
        let priceChange = currentPrice - close
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


extension MarketDetail {
    //private func dataListView(title: String, data: Double) -> some View {
    private func dataListView(title: String, data: String) -> some View {
        HStack {
            Text(title)
                .fontWeight(.bold)
            Spacer()
                //Text("\(data, specifier: "%.2f")")
            Text("\(Double(data) ?? 0, specifier: "%.2f")")
                .fontWeight(.bold)
        }
    }
}

extension MarketDetail {
    private var originalTitle: some View {
        return
        Text("ok")
    }
}
