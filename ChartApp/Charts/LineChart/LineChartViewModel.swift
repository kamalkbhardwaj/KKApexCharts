//
//  LineChartViewModel.swift
//  ChartApp
//
//  Created by Kamal Kishor on 19/07/25.
//

import Charts
import Foundation

extension LineChartView {
    @MainActor
    final public class Model: ObservableObject {
        
        var data: [SalesData] = .init()
        @Published var interpolationMethod: InterpolationMethod
        @Published var lineWidth: CGFloat
        
        init (interpolationMethod: InterpolationMethod = .monotone, lineWidth: CGFloat = 4.0) {
            self.interpolationMethod = interpolationMethod
            self.lineWidth = lineWidth
            self.prepareData()
        }
        
        private func prepareData() {
            self.data = [
                SalesData(month: "Jan", sales: 1200, year: "2024"),
                SalesData(month: "Feb", sales: 1500, year: "2024"),
                SalesData(month: "Mar", sales: 1350, year: "2024"),
                SalesData(month: "Apr", sales: 1700, year: "2024"),
                SalesData(month: "May", sales: 1600, year: "2024"),
                SalesData(month: "Jun", sales: 1950, year: "2024"),
                SalesData(month: "Jan", sales: 1050, year: "2025"),
                SalesData(month: "Feb", sales: 1250, year: "2025"),
                SalesData(month: "Mar", sales: 1175, year: "2025"),
                SalesData(month: "Apr", sales: 1450, year: "2025"),
                SalesData(month: "May", sales: 1350, year: "2025"),
                SalesData(month: "Jun", sales: 1580, year: "2025"),
            ]
        }
        
        var allInterpolationMethods: [InterpolationMethod] {
            [.linear, .monotone, .cardinal, .catmullRom, .monotone, .stepStart, .stepEnd, .stepCenter]
        }
    }
    
    struct SalesData: Identifiable {
        let id = UUID()
        let month: String
        let sales: Double
        let year: String
    }
    
    @frozen public enum Style {
        case line
    }
}

extension InterpolationMethod: @retroactive Hashable {
    public static func == (lhs: InterpolationMethod, rhs: InterpolationMethod) -> Bool {
        lhs.description == rhs.description
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.description)
    }
}
