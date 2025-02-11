//
//  RealmRepository.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation
import RealmSwift

protocol TaskRepositoryProtocol {
    func fetchTasks() -> Results<RealmModel>
    func addTask(title: String)
    func toggleTaskCompletion(_ task: RealmModel)
    func write(_ block: () -> Void)
    func read<T>(_ block: () -> T) -> T
}

class TaskRepository: TaskRepositoryProtocol {
    private let realm = try! Realm()
    
    func fetchTasks() -> Results<RealmModel> {
        return read { realm.objects(RealmModel.self) }
    }
    
    func addTask(title: String) {
        write {
            let task = RealmModel()
            task.title = title
            realm.add(task)
        }
    }
    
    func toggleTaskCompletion(_ task: RealmModel) {
        write {
            task.isCompleted.toggle()
        }
    }
    
    func write(_ block: () -> Void) {
        try! realm.write {
            block()
        }
    }
    
    func read<T>(_ block: () -> T) -> T {
        return block()
    }
}
