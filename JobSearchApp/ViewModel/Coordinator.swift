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
    
    // Список страниц приложения
    enum Page {
        case login
        case verifying
        case search
        case vacancyDetails(Vacancy)
        case favourites
        case responses
        case messages
        case profile
    }
    
    // Список страниц для таббара
    let tabs: [Page] = [.search, .favourites, .responses, .messages, .profile]
    
    //Пуш страницы
    func push(_ page: Page) {
        withAnimation{
            path.append(page)
        }
    }
    
    // Поп back страницы
    func pop() {
        withAnimation {
            path.removeLast()
        }
    }
    
    // Метод с логикой смены страницы
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
    
    @ViewBuilder func view(for page: Page) -> some View {
        switch page {
        case .login:
            MainLoginView()
        case .verifying:
            VerificationView()
        case .search:
            SearchView()
        case .vacancyDetails(let vacancy):
            NavigationView { 
                VacancyDetailsView(vacancy: vacancy)
            }
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
    
    // Identifiable func
    static func == (lhs: Coordinator.Page, rhs: Coordinator.Page) -> Bool {
        lhs.id == rhs.id
    }
    
    // Hashable func
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //id страниц, используются для перключения и подстановки иконок и названия
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
