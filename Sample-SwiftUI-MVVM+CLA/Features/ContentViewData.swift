//
//  ContentViewData.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation

struct ContentViewData: Equatable {
    var cellData: [CellData]
    var newTaskTitle: String = ""
}

struct CellData: Equatable {
    let id: String
    var title: String
    let isCompleted: Bool
    
    var imageName: String {
        isCompleted ? "checkmark.circle.fill" : "circle"
    }
}
