//
//  Line.swift
//  MarketWatch2
//
//  Created by vincent schmitt on 29/03/2021.
//

//import Foundation
import SwiftUI
import Charts

struct Line: UIViewRepresentable {
    var entries : [ChartDataEntry]
    
    typealias UIViewType = LineChartView
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> LineChartData {
        let data = LineChartData()
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.green]
        dataSet.label = "My line data"
        data.append(dataSet)
        return data
    }
    
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        Line(entries: [ChartDataEntry(x: 1.0, y: 1.0), ChartDataEntry(x: 2.0, y: 3.0), ChartDataEntry(x: 3.0, y: 2.0), ChartDataEntry(x: 4.0, y: 5.0), ChartDataEntry(x: 5.0, y: 1.0)])
    }
}
