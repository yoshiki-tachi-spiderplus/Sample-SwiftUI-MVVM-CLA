//
//  Entity.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation

struct Entity {
    let id: String
    let title: String
    let isCompleted: Bool
    
    func toRealmModel() -> RealmModel {
        let realmModel = RealmModel()
        realmModel.id = id
        realmModel.title = title
        realmModel.isCompleted = isCompleted
        return realmModel
    }
}
