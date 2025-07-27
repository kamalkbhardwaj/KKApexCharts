//
//  ChartView.swift
//  ChartApp
//
//  Created by Kamal Kishor on 22/12/24.
//

import SwiftUI
import Charts

public struct ChartView: View {
    
    @StateObject private var model: Self.Model
    
    public init(model: Self.Model) {
        self._model = StateObject(wrappedValue: model)
    }
    
    public var body: some View {
        NavigationView {
            scrollView
                .navigationTitle("Charts")
        }
    }
    
    private var scrollView: some View {
        ScrollView {
            LineChartView(
                model: .init(
                    interpolationMethod: .linear,
                    lineWidth: 2.0
                )
            )
            
            BarChartView(
                model: .init(
                    stackType: .standard,
                    style: .grouped
                )
            )
            
            BarChartView(
                model: .init(
                    stackType: .standard,
                    style: .oneD
                )
            )
            
            BarChartView(
                model: .init(
                    stackType: .standard,
                    style: .progress
                )
            )
            
            BarChartView(
                model: .init(
                    stackType: .standard,
                    style: .pulse
                )
            )
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ChartView(model: .init())
}
