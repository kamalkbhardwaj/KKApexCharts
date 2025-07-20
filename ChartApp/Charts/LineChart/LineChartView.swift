//
//  LineChartView.swift
//  ChartApp
//
//  Created by Kamal Kishor on 19/07/25.
//

import Charts
import SwiftUI

struct LineChartView: View {
    @ObservedObject private var model: Self.Model
    
    public init(model: Self.Model) {
        self.model = model
    }
    
    public var body: some View {
        VStack {
            menu
            chartView
        }
    }
    
    private var menu: some View {
        VStack {
            Text("Monthly Sales Trend")
                .font(.title2)
            Menu(model.interpolationMethod.description) {
                ForEach(model.allInterpolationMethods, id: \.self) { method in
                    Button(method.description) {
                        model.interpolationMethod = method
                    }
                }
            }
            .menuStyle(.borderlessButton)
            Slider(value: $model.lineWidth, in: 1...10, step: 0.5)
        }
        .padding()
        .padding(.bottom, 44.0)
    }
    
    private var chartView: some View {
        Chart(self.model.data) { dataPoint in
            lineChart(dataPoint)
        }
        .chartXAxis {
            AxisMarks(
                position: .bottom,
                values: .automatic
            ) { value in
                AxisGridLine()
                AxisValueLabel()
            }
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
        .padding()
        .frame(height: 400)
    }
    
    private func lineChart(_ dataPoint: Self.SalesData) -> some ChartContent {
        LineMark(
            x: .value("Month", dataPoint.month),
            y: .value("Sales", dataPoint.sales)
        )
        .interpolationMethod(model.interpolationMethod)
        .lineStyle(.init(lineWidth: model.lineWidth, lineCap: .round))
        .symbol(.square)
        .foregroundStyle(dataPoint.year == "2024" ? Color.blue : Color.red)
        .foregroundStyle(by: .value("Year", dataPoint.year))
    }
}
    
struct ChartLegend: View {
    let color: Color
    let title: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 2.0)
                .fill(color)
                .frame(width: 20.0, height: 4.0)
            Text(title)
                .font(.body)
        }
    }
}

#Preview {
    LineChartView(model: .init())
}
