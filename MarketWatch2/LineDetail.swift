//
//  LineDetail.swift
//  MarketWatch2
//
//  Created by vincent schmitt on 30/03/2021.
//

//import Foundation
import SwiftUI
import Charts

struct LineDetail: UIViewRepresentable {
    var entries : [ChartDataEntry]
    var chartName = "My line chart"
    
    typealias UIViewType = LineChartView
    
    func makeUIView(context: Context) -> LineChartView {
        let chart = LineChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: LineChartView, context: Context) {
        uiView.data = addData()
        // yoko added
        //uiView.xAxis.drawLabelsEnabled = false
        //uiView.leftAxis.drawLabelsEnabled = false
        //uiView.rightAxis.drawLabelsEnabled = false
        //uiView.drawGridBackgroundEnabled = false
        // yoko end
    }
    
    func addData() -> LineChartData {
        let data = LineChartData()
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.green]
        dataSet.label = chartName
        // added by yoko
        dataSet.circleRadius = 5
        dataSet.circleHoleRadius = 2
        //dataSet.drawCirclesEnabled = false
        //dataSet.drawValuesEnabled = false
        //dataSet.drawVerticalHighlightIndicatorEnabled = false
        //dataSet.drawHorizontalHighlightIndicatorEnabled = false
        // added end
        data.append(dataSet)
        return data
    }
    
}

struct LineDetail_Previews: PreviewProvider {
    static var previews: some View {
        LineDetail(entries: [ChartDataEntry(x: 1.0, y: 1.0), ChartDataEntry(x: 2.0, y: 3.0), ChartDataEntry(x: 3.0, y: 2.0), ChartDataEntry(x: 4.0, y: 5.0), ChartDataEntry(x: 5.0, y: 1.0)])
    }
}
