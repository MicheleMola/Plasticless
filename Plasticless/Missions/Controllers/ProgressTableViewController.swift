//
//  ProgressTableViewController.swift
//  Plasticless
//
//  Created by Michele Mola on 16/10/2018.
//  Copyright © 2018 Michele Mola. All rights reserved.
//

import UIKit
import Charts

class ProgressTableViewController: UITableViewController {
  
  @IBOutlet weak var barChartView: BarChartView!
  
  let superChallenges: [Double] = [20, 30, 25, 22, 28, 25, 25, 19, 31, 25, 24, 26]
  let challenges: [Double] = [35, 33, 30, 36, 33, 35, 33, 33, 29, 37, 27, 39]
  
  let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  func setupView() {
    
    tableView.tableFooterView = UIView()
    
    //legend
    let legend = barChartView.legend
    legend.enabled = true
    legend.horizontalAlignment = .right
    legend.verticalAlignment = .top
    legend.orientation = .vertical
    legend.drawInside = true
    legend.yOffset = 10.0;
    legend.xOffset = 10.0;
    legend.yEntrySpace = 0.0;
    legend.textColor = UIColor.black
    
    // Y - Axis Setup
    let yaxis = barChartView.leftAxis
    yaxis.spaceTop = 0.35
    yaxis.axisMinimum = 0
    yaxis.drawGridLinesEnabled = false
    yaxis.labelTextColor = UIColor.black
    yaxis.axisLineColor = UIColor.black
    
    barChartView.rightAxis.enabled = false
    
    // X - Axis Setup
    let xaxis = barChartView.xAxis
    let formatter = CustomLabelsXAxisValueFormatter()//custom value formatter
    formatter.labels = self.months
    xaxis.valueFormatter = formatter
    
    xaxis.drawGridLinesEnabled = false
    xaxis.labelPosition = .bottom
    xaxis.labelTextColor = UIColor.black
    xaxis.centerAxisLabelsEnabled = true
    xaxis.axisLineColor = UIColor.black
    xaxis.granularityEnabled = true
    xaxis.enabled = true
    
    
    //barChartView.delegate = self
    barChartView.noDataText = "You need to provide data for the chart."
    barChartView.noDataTextColor = UIColor.white
    barChartView.chartDescription?.textColor = UIColor.clear
    
    setChart()
  }
  
  func setChart() {
    barChartView.noDataText = "Loading...!!"
    var dataEntries: [BarChartDataEntry] = []
    var dataEntries1: [BarChartDataEntry] = []
    
    for i in 0..<self.months.count {
      
      let dataEntry = BarChartDataEntry(x: Double(i) , y: self.superChallenges[i])
      dataEntries.append(dataEntry)
      
      let dataEntry1 = BarChartDataEntry(x: Double(i) , y: self.challenges[i])
      dataEntries1.append(dataEntry1)
      
    }
    
    let chartDataSet = BarChartDataSet(values: dataEntries, label: "Super Challenges")
    let chartDataSet1 = BarChartDataSet(values: dataEntries1, label: "Challenges")
    
    let dataSets: [BarChartDataSet] = [chartDataSet,chartDataSet1]
    chartDataSet.colors = [UIColor(red: 132/255, green: 190/255, blue: 185/255, alpha: 1)]
    chartDataSet1.colors = [UIColor(red: 243/255, green: 207/255, blue: 118/255, alpha: 1)]
    
    
    let chartData = BarChartData(dataSets: dataSets)
    
    let groupSpace = 0.4
    let barSpace = 0.03
    let barWidth = 0.2
    
    chartData.barWidth = barWidth
    
    barChartView.xAxis.axisMinimum = 0.0
    barChartView.xAxis.axisMaximum = 0.0 + chartData.groupWidth(groupSpace: groupSpace, barSpace: barSpace) * Double(self.months.count)
    
    chartData.groupBars(fromX: 0.0, groupSpace: groupSpace, barSpace: barSpace)
    
    barChartView.xAxis.granularity = barChartView.xAxis.axisMaximum / Double(self.months.count)
    
    barChartView.data = chartData
    
    barChartView.notifyDataSetChanged()
    barChartView.setVisibleXRangeMaximum(4)
    barChartView.animate(yAxisDuration: 1.0, easingOption: .linear)
    chartData.setValueTextColor(UIColor.white)
  }
  
}

