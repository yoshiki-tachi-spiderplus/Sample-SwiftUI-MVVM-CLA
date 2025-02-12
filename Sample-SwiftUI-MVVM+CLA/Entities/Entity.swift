//
//  Entity.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation
import RealmSwift

struct Entity {
    let id: ObjectId
    let title: String
    let isCompleted: Bool
}

extension ObjectId {
    static func toObjectId(str: String) -> ObjectId {
        guard let objectId = try? ObjectId(string: str) else {
            fatalError("ObjectId is invalid")
        }
        return objectId
    }
}

