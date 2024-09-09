//
//  VacancyPrewiev.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 12.04.2024.
//

import SwiftUI

struct VacancyPreview: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject var viewModel = AppViewModel()
        var vacancy: Vacancy
    
        @State private var isFavorited = false

    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if let lookingNumber = vacancy.lookingNumber {
                    Text("Сейчас просматривает \(lookingNumber) \(viewModel.pluralize(lookingNumber, "человек", "человека", "человек"))")
                        .fontText1()
                        .foregroundColor(.uiGreen)
                }
                Spacer()
                
                Button(action: {
                    viewModel.toggleFavorites(for: vacancy)
                }) {
                    Image(vacancy.isFavorite ? "Избранное Active" : "Избранное Default")
                }
                
            }
            
            Text(vacancy.title)
                .fontTitle3()
                .foregroundColor(.uiWhite)
            
            Text("\(vacancy.address.town)")
                .fontText1()
                .foregroundColor(.uiWhite)
            
            HStack {
                Text("\(vacancy.company)")
                    .fontText1()
                    .foregroundColor(.uiWhite)
                Image("Check mark")
                
            }
            
            
            HStack {
                Image("Опыт")
                    .foregroundColor(.uiWhite)
                
                Text("\(vacancy.experience.previewText)")
                    .fontText1()
                    .foregroundColor(.uiWhite)
            }
            
            Text("Опубликовано \(viewModel.formattedDate(from: vacancy.publishedDate ?? ""))")
                .fontText1()
                .foregroundColor(.uiGray4)
            
            
            Button(action: {
                print("")
            }) {
                Text("Откликнуться")
                    .frame(maxWidth: .infinity)
                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                    .frame(height: 32)
                    .background(Color.uiGreen)
                    .foregroundColor(.uiWhite)
                    .cornerRadius(50)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)
        .background(Color.uiGray1, in: RoundedRectangle(cornerRadius: 8))
        .onTapGesture {
            coordinator.push(.vacancyDetails(vacancy))
        }
        
    }
      
        
}

struct VacancyPreview_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        let firstVacancy: Vacancy = viewModel.allVacancies.first ?? Vacancy(id: "sdsd", lookingNumber: 7, title: "IOS Developer", address: Vacancy.Address(town: "Минск", street: "Шусева", house: "15"), company: "Luxsoft", experience: Vacancy.Experience(text: "1-3", previewText: "Опыт 1-3 года"), publishedDate: "24-12-2024", isFavorite: true, salary: Vacancy.Salary(full: nil, short: nil), schedules: [], appliedNumber: nil, description: nil, responsibilities: "", questions: [])

        return VacancyPreview(vacancy: firstVacancy)
    }
}
