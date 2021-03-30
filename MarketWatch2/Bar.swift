//
//  Bar.swift
//  MarketWatch2
//
//  Created by vincent schmitt on 29/03/2021.
//

//import Foundation
import Charts
import SwiftUI

struct Bar : UIViewRepresentable {
    var entries : [BarChartDataEntry]
    func makeUIView(context: Context) -> BarChartView {
        let chart = BarChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: BarChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> BarChartData {
        let data = BarChartData()
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.green]
        dataSet.label = "MyData"
        data.append(dataSet)
        return data
    }
    
    typealias UIViewType = BarChartView
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(entries: [BarChartDataEntry(x:1, y:1), BarChartDataEntry(x:2, y:1), BarChartDataEntry(x:3, y:1), BarChartDataEntry(x:4, y:1), BarChartDataEntry(x:5, y:1)])
    }
}
