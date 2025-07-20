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
            self.barChart(dataPoint)
        }
        .chartYAxis {
            AxisMarks(
                position: .leading,
                values: .automatic
            ) { value in
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
        .chartXAxisLabel(self.model.stackType.description.capitalized, position: .bottom)
        .padding()
        .frame(height: 400)
    }
    
    private func barChart(_ dataPoint: Self.SalesData) -> some ChartContent {
        BarMark(
            x: .value("Month", dataPoint.month),
            y: .value("Sales", dataPoint.sales),
            stacking: .unstacked
        )
        .foregroundStyle(dataPoint.year == "2024" ? Color.blue : Color.red)
        .foregroundStyle(by: .value("Year", dataPoint.year))
    }
}

#Preview {
    BarChartView(model: .init(stackType: .standard))
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
