//
//  Coordinator.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 07.04.2024.
//

import SwiftUI


class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var startPage = Page.login
    @Published var pushDirection = Edge.trailing

    enum Page {
        case login
        case verifying
        case search
        case vacancyDetails
        case favourites
        case responses
        case messages
        case profile
    }
    
    let tabs: [Page] = [.search, .favourites, .responses, .messages, .profile]
    
    func push(_ page: Page) {
        withAnimation{
            path.append(page)
        }
    }
    
    func pop() {
        withAnimation {
            path.removeLast()
        }
    }
    
    func changeTab(to page: Page) {
        if (startPage != page) {
            if (tabs.firstIndex(of: startPage) ?? Int.max < tabs.firstIndex(of: page) ?? Int.max) {
                pushDirection = .trailing
            } else {
                pushDirection = .leading
            }
            withAnimation {
                path.removeLast(path.count)
                startPage = page
            }
        }
    }
    
    @ViewBuilder func view (for page: Page) -> some View {
        switch page {
        case .login:
            MainLoginView()
        case .verifying:
            VerificationView()
        case .search:
            SearchView()
        case .vacancyDetails:
            VacancyDetailsView(vacancy: AppViewModel().allVacancies.first!)
        case .favourites:
            FavouritesView()
        case .responses:
           ResponsesView()
        case .messages:
            MessagesView()
        case .profile:
            ProfileView()
        }
    }
}

extension Coordinator.Page: Identifiable, Hashable {
    
    var id: String {
        switch self {
        case .login:
            return "Логин"
        case .verifying:
            return "Верификация"
        case .search:
            return "Поиск"
        case .vacancyDetails:
            return "Описание вакансии"
        case .favourites:
            return "Избранное"
        case .responses:
            return "Отклики"
        case .messages:
            return "Сообщения"
        case .profile:
            return "Профиль"
        }
    }

}
