//
//  CandleStick.swift
//  MarketWatch2
//
//  Created by vincent schmitt on 29/03/2021.
//

//import Foundation
import Charts
import SwiftUI

struct CandleStick : UIViewRepresentable{
    var entries : [CandleChartDataEntry]
    typealias UIViewType = CandleStickChartView
    
    func makeUIView(context: Context) -> CandleStickChartView {
        let chart = CandleStickChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: CandleStickChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> CandleChartData {
        let data = CandleChartData()
        let dataSet = CandleChartDataSet(entries: entries)
        //dataSet.colors = [NSUIColor.green]
        dataSet.label = "My candle stick chart"
        data.append(dataSet)
        return data
    }
}

struct CandleStick_Previews: PreviewProvider {
    static var previews: some View {
        CandleStick(entries: [CandleChartDataEntry(x: 1.0, shadowH: 10.0, shadowL: 2.0, open: 4.0, close: 3.0), CandleChartDataEntry(x: 3.0, shadowH: 20.0, shadowL: 3.0, open: 4.0, close: 6.0), CandleChartDataEntry(x: 5.0, shadowH: 15.0, shadowL: 4.0, open: 7.0, close: 5.0), CandleChartDataEntry(x: 7.0, shadowH: 30.0, shadowL: 10.0, open: 15.0, close: 20.0), CandleChartDataEntry(x: 9.0, shadowH: 25.0, shadowL: 20.0, open: 23.0, close: 21.0)])
    }
}
