//
//  ContentView.swift
//  MarketWatch2
//
//  Created by vincent schmitt on 29/03/2021.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        /*
        VStack {
        /*
        Text("My Chart")
        Bar(entries: [BarChartDataEntry(x:1, y:1), BarChartDataEntry(x:2, y:2), BarChartDataEntry(x:3, y:3), BarChartDataEntry(x:4, y:4), BarChartDataEntry(x:5, y:5)])
        */
        /*
        Text("My candle stick chart")
            CandleStick(entries: [CandleChartDataEntry(x: 1.0, shadowH: 10.0, shadowL: 5.0, open: 6.0, close: 8.0), CandleChartDataEntry(x: 2.0, shadowH: 20.0, shadowL: 4.0, open: 15.0, close: 10.0), CandleChartDataEntry(x: 3.0, shadowH: 15.0, shadowL: 2.0, open: 13.0, close: 14.0), CandleChartDataEntry(x: 4.0, shadowH: 9.0, shadowL: 6.0, open: 8.0, close: 7.0), CandleChartDataEntry(x: 5.0, shadowH: 25.0, shadowL: 15.0, open: 16.0, close: 24.0)])
        */
        
        Text("My combined chart")
        Combined(chartView: CombinedChartView())

        }
    */
        MarketListJson()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
