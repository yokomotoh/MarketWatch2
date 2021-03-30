//
//  Combined.swift
//  MarketWatch2
//
//  Created by vincent schmitt on 29/03/2021.
//

//import Foundation
import Charts
import SwiftUI

private let ITEM_COUNT = 12

struct Combined : UIViewRepresentable {
    
    typealias UIViewType = CombinedChartView
    let chartView: CombinedChartView!
    
    func makeUIView(context: Context) -> CombinedChartView {
        let chart = CombinedChartView()
        return chart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.data = addData()
    }
    
    func addData() -> CombinedChartData {
        let data = CombinedChartData()
        data.lineData = generateLineData()
        data.barData = generateBarData()
        
        chartView.xAxis.axisMaximum = data.xMax + 0.25
        chartView.data = data
        return chartView.data as! CombinedChartData
    }
    
    func generateLineData() -> LineChartData {
        /*
        let entries = (0..<ITEM_COUNT).map { (i) -> ChartDataEntry in
            return ChartDataEntry(x: Double(i) + 0.5, y: Double(arc4random_uniform(15) + 5))
        }
        */
        let entries = [ChartDataEntry(x: 0, y: 0), ChartDataEntry(x: 1.0, y: 1.0), ChartDataEntry(x: 2.0, y: 2.0), ChartDataEntry(x: 3.0, y: 2.0), ChartDataEntry(x: 4.0, y: 2.0), ChartDataEntry(x: 5.0, y: 2.0)]
        
        let set = LineChartDataSet(entries: entries, label: "Line DataSet")
        set.setColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
        set.lineWidth = 2.5
        set.setCircleColor(UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1))
        set.circleRadius = 5
        set.circleHoleRadius = 2.5
        set.fillColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
        set.mode = .cubicBezier
        set.drawValuesEnabled = true
        set.valueFont = .systemFont(ofSize: 10)
        set.valueTextColor = UIColor(red: 240/255, green: 238/255, blue: 70/255, alpha: 1)
        
        set.axisDependency = .right
        
        return LineChartData(dataSet: set)
    }
    
    func generateBarData() -> BarChartData {
        /*
        let entries1 = (0..<ITEM_COUNT).map { _ -> BarChartDataEntry in
            return BarChartDataEntry(x: 0, y: Double(arc4random_uniform(25) + 25))
        }
        */
        let entries1 = [BarChartDataEntry(x: 1.0, y: 1.0), BarChartDataEntry(x: 2.0, y: 2.0), BarChartDataEntry(x: 3.0, y: 2.0), BarChartDataEntry(x: 4.0, y: 2.0), BarChartDataEntry(x: 5.0, y: 2.0)]
        
        let set1 = BarChartDataSet(entries: entries1, label: "Bar 1")
        set1.setColor(UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1))
        set1.valueTextColor = UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1)
        set1.valueFont = .systemFont(ofSize: 10)
        set1.axisDependency = .left
        
        let groupSpace = 0.06
        
        let barSpace = 0.02 // x2 dataset
        
        let barWidth = 0.45 // x2 dataset
        // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
        
        let data: BarChartData = [set1]
        
        //data.barWidth = barWidth
        
        // make this BarData object grouped
        //data.groupBars(fromX: 0, groupSpace: groupSpace, barSpace: barSpace)
        
        return data
    }
}

struct Combined_Previews: PreviewProvider {
    static var previews: some View {
        Combined(chartView: CombinedChartView())
    }
}
