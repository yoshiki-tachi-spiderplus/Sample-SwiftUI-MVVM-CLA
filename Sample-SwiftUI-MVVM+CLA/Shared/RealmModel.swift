//
//  RealmModel.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation
import RealmSwift

class RealmModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var isCompleted: Bool = false
    
    func toEntity() -> Entity {
        return Entity(id: id, title: title, isCompleted: isCompleted)
    }
}
