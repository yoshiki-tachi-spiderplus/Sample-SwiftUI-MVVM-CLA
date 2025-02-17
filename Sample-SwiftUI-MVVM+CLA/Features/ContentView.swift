//
//  ContentView.swift
//  Sample-SwiftUI-MVVM+CLA
//
//  Created by sp_user on 2025/02/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("New Task", text: .init(get: viewModel.getNewTaskTitle, set: viewModel.setNewTaskTitle(_:)))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Add Task") {
                    // TODO: Buttou action rename
                    viewModel.addTask()
                }
                .padding()
                
                List {
                    ForEach($viewModel.viewData.cellData, id: \.id) { data in
                        HStack {
                            Text(verbatim: data.title.wrappedValue)
                            Spacer()
                            Button(action: {
                                // TODO: Buttou action rename
                                viewModel.toggleTaskCompletion(data.wrappedValue)
                            }) {
                                // TODO: ロジック入ってる
                                Image(systemName: data.wrappedValue.imageName)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}
