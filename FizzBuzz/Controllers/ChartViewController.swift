//
//  ChartViewController.swift
//  FizzBuzz
//
//  Created by François Delaplace on 05/07/2021.
//

import UIKit
import Charts

class ChartViewController: UIViewController, ChartViewDelegate {

    @IBOutlet var chartView: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bar Chart"
        self.setup(barLineChartView: chartView)
        
        chartView.delegate = self
        
        chartView.drawBarShadowEnabled = false
        chartView.drawValueAboveBarEnabled = false
        
        chartView.maxVisibleCount = 60
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 10)
        xAxis.granularity = 1
        xAxis.labelCount = 7
        
        let leftAxisFormatter = NumberFormatter()
        leftAxisFormatter.minimumFractionDigits = 0
        leftAxisFormatter.maximumFractionDigits = 1
        
        let leftAxis = chartView.leftAxis
        leftAxis.labelFont = .systemFont(ofSize: 10)
        leftAxis.labelCount = 8
        leftAxis.valueFormatter = DefaultAxisValueFormatter(formatter: leftAxisFormatter)
        leftAxis.labelPosition = .outsideChart
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0
        
        let l = chartView.legend
        l.horizontalAlignment = .left
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.form = .circle
        l.formSize = 9
        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
        l.xEntrySpace = 4

        self.updateChartData()
    }
    
    func updateChartData() {
        self.setDataCount()
    }
    
    func setDataCount() {
        
        /*guard let data = Statistics.load() else {
            return
        }*/
        let data = ["Toto": 2.0, "Tata": 3.0]
        var yVals = [BarChartDataEntry]()
        var index = 0.0
        for key in data.keys {
            yVals.append(BarChartDataEntry(x: Double(index), y: data[key]!, data: key))
            index =  index + 1.0
        }
        
        var set1: BarChartDataSet! = nil
        if let set = chartView.barData?.dataSets.first as? BarChartDataSet {
            set1 = set
            set1.replaceEntries(yVals)
            chartView.data?.notifyDataChanged()
            chartView.notifyDataSetChanged()
        } else {
            let ylabel = NSLocalizedString("Parameters", comment: "")
            set1 = BarChartDataSet(entries: yVals, label: ylabel)
            set1.colors = ChartColorTemplates.material()
            set1.drawValuesEnabled = false
            
            let data = BarChartData(dataSet: set1)
            data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 10)!)
            data.barWidth = 0.9
            chartView.data = data
        }
        chartView.setNeedsDisplay()
    }
    
    func setup(barLineChartView chartView: BarLineChartViewBase) {
        
        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        
        chartView.rightAxis.enabled = false
    }
}
