//
//  RealmRepository.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation

protocol TaskRepositoryProtocol {
    func fetchTasks() -> [RealmModel]
    func addTask(title: String)
    func toggleTaskCompletion(_ task: RealmModel)
}

class TaskRepository: TaskRepositoryProtocol {
    private let realmManager = RealmManager.shared

    func fetchTasks() -> [RealmModel] {
        realmManager.fetch(RealmModel.self).map(RealmModel.init)
    }

    func addTask(title: String) {
        let task = RealmModel()
        task.title = title
        realmManager.add(task)
    }

    func toggleTaskCompletion(_ task: RealmModel) {
        if let realmTask = realmManager.find(RealmModel.self, key: task.id) {
            realmManager.update {
                realmTask.isCompleted.toggle()
            }
        }
    }
}
