//
//  ContentViewModel.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation
import RealmSwift

class ContentViewModel: ObservableObject {
    private let useCase: TaskUseCaseProtocol
    @Published var tasks: [ContentViewData] = []
    
    init(useCase: TaskUseCaseProtocol = TaskUseCase(repository: TaskRepository())) {
        self.useCase = useCase
        observeTasks()
    }
    
    private func observeTasks() {
        tasks = useCase.getTasks().map { .init(id: $0.id.stringValue, title: $0.title, isCompleted: $0.isCompleted) }
    }
    
    func addTask(title: String) {
        useCase.createTask(title: title)
        observeTasks()
    }
    
    func toggleTaskCompletion(_ task: ContentViewData) {
        do {
            let id = try ObjectId(string: task.id)
            useCase.changeTaskStatus(.init(id: id, title: task.title, isCompleted: task.isCompleted))
            observeTasks()
        } catch {
            print(error)
        }
    }
}
