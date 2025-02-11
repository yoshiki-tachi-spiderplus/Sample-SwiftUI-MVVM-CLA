//
//  ContentUseCase.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation

protocol TaskUseCaseProtocol {
    func getTasks() -> [Entity]
    func createTask(title: String)
    func changeTaskStatus(_ task: Entity)
}

class TaskUseCase: TaskUseCaseProtocol {
    private let repository: TaskRepositoryProtocol
    
    init(repository: TaskRepositoryProtocol) {
        self.repository = repository
    }
    
    func getTasks() -> [Entity] {
        return repository.fetchTasks().map { $0.toEntity() }
    }
    
    func createTask(title: String) {
        repository.addTask(title: title)
    }
    
    func changeTaskStatus(_ task: Entity) {
        if let realmTask = repository.fetchTasks().first(where: { $0.id == task.id }) {
            repository.toggleTaskCompletion(realmTask)
        }
    }
}
