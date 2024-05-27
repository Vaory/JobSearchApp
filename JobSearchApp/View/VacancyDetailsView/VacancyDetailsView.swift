//
//  VacancyDetailsView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct VacancyDetailsView: View {
    
    @ObservedObject var viewModel = AppViewModel()
    let vacancy: Vacancy
    @State private var isFavorited = false
    
    var body: some View {
        ScrollView (.vertical) {
            VStack (alignment: .leading) {
                HStack (spacing: 16) {
                    Button(action: {
                        print("f")
                        }) {
                            Image("Left arrow")
                                }
                            Spacer()
                                
                            Image("Eye")
                                
                            Image("Share")
                                
                        Button(action: {
                            viewModel.toggleFavorites(for: vacancy)
                        }) {
                        Image(vacancy.isFavorite ? "Избранное Active" : "Избранное Default")
                                .resizable()
                                .frame(width: 24, height: 24)
                    }
                }
                
                Spacer().frame(height: 28)
                
                Text("\(vacancy.title)")
                    .fontTitle1()
                        .foregroundColor(.uiWhite)
                
                Spacer().frame(height: 16)
                
                Text("\(vacancy.salary.full ?? "Уровень дохода не указан")")
                    .fontText1()
                    .foregroundColor(.uiWhite)
                
                Spacer().frame(height: 16)
                
                Text("Требуемый опыт \(vacancy.experience.text)")
                    .fontText1()
                    .foregroundColor(.uiWhite)
                
                Spacer().frame(height: 6)
                
                Text(vacancy.schedules.enumerated().map { index, schedule in
                    index == 0 ? schedule.capitalized : schedule.lowercased()
                }.joined(separator: ", "))
                    .fontText1()
                    .foregroundColor(.uiWhite)
                
                Spacer().frame(height: 27)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 17)
            .padding(.horizontal, 17)
        }
        .frame(maxWidth: .infinity)
        .background(Color.uiBlack)
        .padding(.vertical, 17)
        .scrollIndicators(.never)
       
    }
}
struct VacancyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        let firstVacancy: Vacancy = viewModel.allVacancies.first ?? Vacancy(id: "sdsd", lookingNumber: 7, title: "IOS Developer", address: Vacancy.Address(town: "Минск", street: "Шусева", house: "15"), company: "Luxsoft", experience: Vacancy.Experience(text: "1-3", previewText: "1-3 "), publishedDate: "24-12-2024", isFavorite: false, salary: Vacancy.Salary(full: "Уроверь дохода не указан", short: nil), schedules: [ "полная занятость, удаленная работа"], appliedNumber: nil, description: nil, responsibilities: "", questions: [])

        return VacancyDetailsView(vacancy: firstVacancy)
    }
}
