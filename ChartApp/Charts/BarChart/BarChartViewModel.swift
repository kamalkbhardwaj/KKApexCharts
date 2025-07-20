//
//  BarChartViewModel.swift
//  ChartApp
//
//  Created by Kamal Kishor on 19/07/25.
//

import Foundation
import Charts

extension BarChartView {
    
    @MainActor
    public final class Model: ObservableObject {
        
        @Published var data: [SalesData] = []
        let stackType: MarkStackingMethod
        
        public init (stackType: MarkStackingMethod = .standard) {
            self.stackType = stackType
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
    }
    
    struct SalesData: Identifiable {
        let id = UUID()
        let month: String
        let sales: Double
        let year: String
    }
}
