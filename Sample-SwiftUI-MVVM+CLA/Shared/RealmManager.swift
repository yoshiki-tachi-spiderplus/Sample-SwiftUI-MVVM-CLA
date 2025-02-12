//
//  RealmManager.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/12.
//

import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    private let realm: Realm

    private init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }

    func fetch<T: Object>(_ type: T.Type) -> Results<T> {
        realm.objects(type)
    }

    func add(_ object: Object) {
        write {
            realm.add(object)
        }
    }

    func update(_ block: () -> Void) {
        write {
            block()
        }
    }

    func find<T: Object, KeyType>(_ type: T.Type, key: KeyType) -> T? {
        return realm.object(ofType: type, forPrimaryKey: key)
    }

    private func write(_ block: () -> Void) {
        do {
            try realm.write {
                block()
            }
        } catch {
            print("Failed to write to Realm: \(error)")
        }
    }
}

