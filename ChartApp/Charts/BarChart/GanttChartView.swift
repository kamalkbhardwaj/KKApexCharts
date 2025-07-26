//
//  GanttChartView.swift
//  ChartApp
//
//  Created by Kamal Kishor on 26/07/25.
//

import SwiftUI
import Charts

public struct GanttChartView: View {
    
    @ObservedObject private var model: Self.Model
    
    init(model: Model) {
        self.model = model
    }
    
    public var body: some View {
        Text("GanttChartView")
    }
}
