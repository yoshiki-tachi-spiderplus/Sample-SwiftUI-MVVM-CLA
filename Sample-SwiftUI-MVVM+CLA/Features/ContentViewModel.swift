//
//  ContentViewModel.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/11.
//

import Foundation

class ContentViewModel: ObservableObject {
    private let useCase: TaskUseCaseProtocol
    @Published var viewData: ContentViewData = .init(cellData: [], newTaskTitle: "")
    
    init(useCase: TaskUseCaseProtocol = TaskUseCase(repository: TaskRepository())) {
        self.useCase = useCase
        updateViewData()
    }
    
    func onAppear() {
        updateViewData()
    }
    
    func setNewTaskTitle(_ title: String) {
        viewData.newTaskTitle = title
    }
    
    func getNewTaskTitle() -> String {
        viewData.newTaskTitle
    }
    
    private func updateViewData() {
        // TODO: reneme Tasks to ViewData
        viewData.cellData = useCase.getTasks().map { .init(id: $0.id, title: $0.title, isCompleted: $0.isCompleted) }
    }
    
    func addTask() {
        guard !viewData.newTaskTitle.isEmpty else { return }
        useCase.createTask(title: viewData.newTaskTitle)
        updateViewData()
        viewData.newTaskTitle = ""
    }
    
    func toggleTaskCompletion(_ task: CellData) {
        useCase.changeTaskStatus(.init(id: task.id, title: task.title, isCompleted: task.isCompleted))
        updateViewData()
    }
}
