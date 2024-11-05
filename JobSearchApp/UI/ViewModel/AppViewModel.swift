//
//  AppViewModel.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 05.04.2024.
//

import Foundation

class AppViewModel: ObservableObject {
    
    @Published var emailAdressText: String = ""
    @Published var isVerifyed = false
    @Published var allVacancies = [Vacancy]()
    @Published var favoriteVacancies = [Vacancy]()
    
    init() {
        loadVacanciesFromJSONFile()
        updateFavoriteVacancies()
    }
    
    // Обновление лайкнутых вакансий
    func updateFavoriteVacancies() {
        favoriteVacancies = allVacancies.filter { $0.isFavorite }
    }
    
    // Метод для кнопки переключения true/false для .isFavorite
    func toggleFavorites(for vacancy: Vacancy) {
        if let index = allVacancies.firstIndex(where: { $0.id == vacancy.id }) {
            allVacancies[index].isFavorite.toggle()
            updateFavoriteVacancies()
        }
    }
    
    // Regex для проверки валидности емэйла
    func emailValidation(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    // Метод для придания дата формата согласно ТЗ
    func formattedDate(from dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "d MMMM"
            return dateFormatter.string(from: date)
        } else {
            return "Дата неизвестна"
        }
    }
    
    // Метод для склонения слов согласно числовому литералу
    func pluralize(_ number: Int, _ singular: String, _ plural: String, _ pluralGenitive: String) -> String {
        let mod10 = number % 10
        let mod100 = number % 100
        switch (mod10, mod100) {
        case (1, 11...14):
            return pluralGenitive
        case (1, _):
            return singular
        case (2...4, 12...14):
            return pluralGenitive
        case (2...4, _):
            return plural
        default:
            return pluralGenitive
        }
    }
        
    // Парсинг JSON файла
    func loadVacanciesFromJSONFile() {
        guard let path = Bundle.main.path(forResource: "vacancies", ofType: "json") else {
            print("Не удалось найти файл json")
            return
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let root = try decoder.decode(Root.self, from: data)
           
            handleResult(root.vacancies)
        } catch {
            print("Ошибка при загрузке данных из файла: \(error)")
        }
    }
    
    func handleResult(_ vacancies: [Vacancy]) {
        allVacancies = vacancies
        updateFavoriteVacancies() // Обновляем список избранных вакансий после загрузки
    }
}
