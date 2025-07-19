//
//  ChartAppApp.swift
//  ChartApp
//
//  Created by Kamal Kishor on 22/12/24.
//

import SwiftUI

@main
struct ChartAppApp: App {
    var body: some Scene {
        WindowGroup {
            ChartView(model: .init(interpolationMethod: .linear, lineWidth: 2.0))
        }
    }
}
