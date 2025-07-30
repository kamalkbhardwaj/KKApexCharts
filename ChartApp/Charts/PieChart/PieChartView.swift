//
//  PieChartView.swift
//  ChartApp
//
//  Created by Kamal Kishor on 28/07/25.
//

import SwiftUI

import SwiftUI
import Charts

struct PieChartView: View {
    
    @ObservedObject private var model: Self.Model
    
    init(model: Self.Model) {
        self.model = StateObject(wrappedValue: model)
    }
    
    var body: some View {
        VStack {
            
        }
    }
}
