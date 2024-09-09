//
//  CoordinatorView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 07.04.2024.
//

import SwiftUI

struct CoordinatorView: View {
    
    @StateObject var coordinator = Coordinator()
    @StateObject var viewModel = AppViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationStack(path: $coordinator.path) {
                ZStack {
                    Color.uiBlack
                    coordinator.view(for: coordinator.startPage)
                        .padding(.horizontal, 17)
                        .background(Color.uiBlack)
                        .transition(.push(from: coordinator.pushDirection))
                        .navigationDestination(for: Coordinator.Page.self) { page in
                            coordinator.view(for: page)
                                .transition(.push(from: coordinator.pushDirection))
                                .padding(.horizontal, 17)
                                .background(Color.uiBlack)
                                .toolbar(.hidden, for: .navigationBar)
                        }
                }
            }
            .background(Color.uiBlack)

            Divider()

            TabBarView()
                .disabled(viewModel.isVerifyed == false)
                .ignoresSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
        .ignoresSafeArea(.all)
        .background(Color.uiBlack)
        .environmentObject(coordinator)
        .environmentObject(viewModel)
    }
}


struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView()
    }
}
