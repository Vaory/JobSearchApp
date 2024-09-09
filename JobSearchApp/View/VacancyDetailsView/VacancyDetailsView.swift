//
//  VacancyDetailsView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct VacancyDetailsView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = AppViewModel()
    @ObservedObject var coordinator = Coordinator()
    
    let vacancy: Vacancy
    
    var body: some View {
        VStack {
            ScrollView (.vertical) {
                VStack (alignment: .leading) {
                    HStack (spacing: 16) {
                        Button(action: {
                            dismiss()
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
                    
                    Group {
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
                    
                    HStack {
                        AppliedAndWatchedBlock(imageName: "Откликнулись", number: vacancy.appliedNumber ?? 0, title: "человек уже откликнулись ")
                        
                        AppliedAndWatchedBlock(imageName: "Смотрят", number: vacancy.lookingNumber ?? 0, title: "человек сейчас смотрят")
                    }
                    
                    Spacer().frame(height: 19)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            Text(vacancy.company)
                                .fontTitle3()
                                .foregroundColor(.uiWhite)
                            
                            Image("Check mark")
                            
                        }
                        
                        Image("map")
                            .resizable()
                        
                        Text("\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)")
                            .fontText1()
                            .foregroundColor(.uiWhite)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 134)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 12)
                    .background(Color.uiGray1, in: RoundedRectangle(cornerRadius: 8))
                    
                    Group {
                        Text(vacancy.description ?? "")
                            .fontText1()
                            .foregroundColor(.uiWhite)
                            .padding(.vertical, 16)
                        
                        Text("Ваши Задачи")
                            .fontTitle2()
                            .foregroundColor(.uiWhite)
                        
                        Spacer().frame(height: 8)
                        
                        Text(vacancy.responsibilities)
                            .fontText1()
                            .foregroundColor(.uiWhite)
                        
                        Spacer().frame(height: 28)
                        
                        Text("Задайте вопрос работодателю")
                            .fontTitle4()
                            .foregroundColor(.uiWhite)
                        
                        Spacer().frame(height: 8)
                        
                        Text("Он получит его вместе с откликом на вакансию")
                            .fontTitle4()
                            .foregroundColor(.uiGray4)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(vacancy.questions, id: \.self) { question in
                            Text(question)
                                .fontText1()
                                .foregroundColor(.uiWhite)
                                .padding(8)
                                .background(Color.uiGray2, in: RoundedRectangle(cornerRadius: 25))
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.uiBlack)
            }
            
            Button(action: {
                print()
            }) {
                Text("Откликнуться")
                    .frame(maxWidth: .infinity)
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(height: 48)
                    .background(Color.uiGreen)
                    .foregroundColor(.uiWhite)
                    .cornerRadius(8)
            }
        }
        .background(Color.uiBlack)
        .scrollIndicators(.never)
        .environmentObject(coordinator)
    }
}
struct VacancyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        let previewVacancy: Vacancy = viewModel.allVacancies.first ?? Vacancy(id: "", lookingNumber: 0, title: "", address: Vacancy.Address(town: "", street: "", house: ""), company: "", experience: Vacancy.Experience(text: "", previewText: ""), publishedDate: "", isFavorite: false, salary: Vacancy.Salary(full: "", short: nil), schedules: [ ""], appliedNumber: 0, description: "", responsibilities: "", questions: [])

        return VacancyDetailsView(vacancy: previewVacancy)
    }
}
