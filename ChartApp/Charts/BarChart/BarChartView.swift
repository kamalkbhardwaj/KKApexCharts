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
            BarMark(
                x: .value("Month", dataPoint.month),
                y: .value("Sales", dataPoint.sales)
            )
            .foregroundStyle(Color.red)
            .foregroundStyle(by: .value("Month", dataPoint.month))
        }
    }
}


#Preview {
    BarChartView(model: .init())
}
