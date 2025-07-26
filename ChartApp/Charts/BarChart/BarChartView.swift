//
//  BarChartView.swift
//  ChartApp
//
//  Created by Kamal Kishor on 19/07/25.
//

import SwiftUI
import Charts

public struct BarChartView: View {
    
    @ObservedObject private var model: Self.Model
    
    public init(model: Self.Model) {
        self.model = model
    }
    
    public var body: some View {
        chartView
    }
    
    private var chartView: some View {
        Chart(self.model.data) { dataPoint in
            switch self.model.style {
            case .grouped:
                barChart(dataPoint)
            case .oneD:
                oneDChart(dataPoint)
            case .interval:
                intervalChart(dataPoint)
            }
        }
        .chartPlotStyle(content: { content in
            content
                .frame(height: self.model.plotAreaHeight)
        })
        .chartXAxis(self.model.xAxisVisibility)
        .chartYAxis(self.model.yAxisVisibility)
        .chartXAxis {
            AxisMarks(
                preset: .aligned,
                position: .bottom,
                values: .automatic(desiredCount: 10, roundUpperBound: true)
            ) { value in
                AxisTick(length: .label)
                AxisGridLine()
                AxisValueLabel()
            }
        }
        .chartYAxis {
            AxisMarks(
                position: .leading,
                values: .automatic
            ) { value in
                AxisTick()
                AxisGridLine()
                AxisValueLabel()
            }
        }
        .chartLegend(
            position: .top,
            alignment: .trailing,
            spacing: 24.0
        ) {
            HStack(spacing: 12.0) {
                ChartLegend(color: .blue, title: "2024")
                ChartLegend(color: .red, title: "2025")
            }
        }
        .padding()
    }
    
    private func barChart(_ dataPoint: Self.SalesData) -> some ChartContent {
        BarMark(
            x: .value("Month", dataPoint.month),
            y: .value("Sales", dataPoint.sales),
            stacking: self.model.stackType
        )
        .position(by: .value("Year", dataPoint.year))
        .foregroundStyle(dataPoint.year == "2024" ? Color.blue : Color.red)
        .annotation {
            Text("\(Int(dataPoint.sales))")
                .font(.caption2)
        }
    }
    
    private func oneDChart(_ dataPoint: Self.SalesData) -> some ChartContent {
        BarMark(
            x: .value("Sales", dataPoint.sales)
        )
        .foregroundStyle(dataPoint.year == "2024" ? Color.blue : Color.red)
        .foregroundStyle(by: .value("Year", dataPoint.year))
    }
    
    private func intervalChart(_ dataPoint: Self.SalesData) -> some ChartContent {
        BarMark(
            x: .value("Month", dataPoint.month),
            y: .value("Sales", dataPoint.sales),
            stacking: .unstacked
        )
        .foregroundStyle(dataPoint.year == "2024" ? Color.blue : Color.red)
        .foregroundStyle(by: .value("Year", dataPoint.year))
    }
}

#Preview("Grouped") {
    BarChartView(model: .init(stackType: .standard, style: .grouped))
}

#Preview("One-D", traits: .landscapeRight) {
    BarChartView(model: .init(stackType: .standard, style: .oneD))
}

#Preview("Interval") {
    BarChartView(model: .init(stackType: .standard, style: .oneD))
}

#Preview("Stacking Style", traits: .landscapeRight) {
    NavigationView {
        HStack(spacing: 24.0) {
            BarChartView(model: .init(stackType: .standard))
                .frame(width: 160)
            BarChartView(model: .init(stackType: .normalized))
                .frame(width: 160)
            BarChartView(model: .init(stackType: .center))
                .frame(width: 160)
            BarChartView(model: .init(stackType: .unstacked))
                .frame(width: 160)
        }
        .padding(.leading, 40.0)
        .scrollIndicators(.hidden)
        .navigationTitle("Bar Charts")
    }
}

