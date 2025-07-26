//
//  BarChartViewModel.swift
//  ChartApp
//
//  Created by Kamal Kishor on 19/07/25.
//

import Foundation
import SwiftUI
import Charts

extension BarChartView {
    
    @MainActor
    public final class Model: ObservableObject {
        
        @Published var data: [SalesData] = []
        let stackType: MarkStackingMethod
        let style: Style
        
        public init (stackType: MarkStackingMethod = .standard, style: Style = .grouped) {
            self.stackType = stackType
            self.style = style
            self.prepareData()
        }
        
        private func prepareData() {
            let allSales = [
                SalesData(previousMonth: "Dec", month: "Jan", previousSales: 300.0, sales: 1200, year: "2024"),
                SalesData(previousMonth: "Jan", month: "Feb", previousSales: 900, sales: 1500, year: "2024"),
                SalesData(previousMonth: "Feb", month: "Mar", previousSales: 1000, sales: 1350, year: "2024"),
                SalesData(previousMonth: "Mar", month: "Apr", previousSales: 1050, sales: 1700, year: "2024"),
                SalesData(previousMonth: "Apr", month: "May", previousSales: 1100, sales: 1600, year: "2024"),
                SalesData(previousMonth: "May", month: "Jun", previousSales: 1250, sales: 1950, year: "2024"),
                SalesData(previousMonth: "Dec", month: "Jan", previousSales: 650, sales: 1050, year: "2025"),
                SalesData(previousMonth: "Jan", month: "Feb", previousSales: 450, sales: 1250, year: "2025"),
                SalesData(previousMonth: "Feb", month: "Mar", previousSales: 1050, sales: 1175, year: "2025"),
                SalesData(previousMonth: "Mar", month: "Apr", previousSales: 975, sales: 1450, year: "2025"),
                SalesData(previousMonth: "Apr", month: "May", previousSales: 950, sales: 1350, year: "2025"),
                SalesData(previousMonth: "May", month: "Jun", previousSales: 1050, sales: 1580, year: "2025"),
            ]
            switch style {
            case .grouped: self.data = allSales
            case .oneD: self.data = allSales
            case .progress: self.data = allSales.filter { $0.year == "2025" }
            case .pulse: self.data = allSales.filter { $0.year == "2024" }
            }
        }
        
        var plotAreaHeight: CGFloat {
            switch style {
            case .grouped: 320.0
            case .oneD: 40.0
            case .progress: 200.0
            case .pulse: 200.0
            }
        }
        
        var xAxisVisibility: Visibility {
            .visible
        }
        
        var yAxisVisibility: Visibility {
            style == .oneD ? .hidden : .visible
        }
        
        var legendVisibility: Visibility {
            (style == .progress || style == .pulse) ? .hidden : .visible
        }
        
        public enum Style {
            case grouped
            case oneD
            case progress
            case pulse
        }
    }
    
    struct SalesData: Identifiable {
        let id = UUID()
        let previousMonth: String
        let month: String
        let previousSales: Double
        let sales: Double
        let year: String
    }
}
