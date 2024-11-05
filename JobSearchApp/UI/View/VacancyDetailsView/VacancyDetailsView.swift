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
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    HeaderView(viewModel: viewModel, vacancy: vacancy)
                    Spacer().frame(height: 28)
                    
                    JobInfoView(vacancy: vacancy)
                    
                    CompanyInfoView(vacancy: vacancy)
                    
                    ResponsibilitiesView(vacancy: vacancy)
                    
                    QuestionsView(vacancy: vacancy)
                }
                .padding()
                .background(Color.uiBlack)
            }
            
            Button(action: {
                // Action for applying to the vacancy
                print("Apply tapped")
            }) {
                Text("Откликнуться")
                    .frame(maxWidth: .infinity)
                    .font(Font.custom("SFProDisplay-Semibold", size: 16))
                    .frame(height: 48)
                    .background(Color.uiGreen)
                    .foregroundColor(.uiWhite)
                    .cornerRadius(8)
            }
            .padding()
        }
        .background(Color.uiBlack)
        .scrollIndicators(.never)
        .environmentObject(coordinator)
    }
}

// MARK: - HeaderView Component
struct HeaderView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AppViewModel
    let vacancy: Vacancy

    var body: some View {
        HStack(spacing: 16) {
            Button(action: { dismiss() }) {
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
    }
}

// MARK: - JobInfoView Component
// MARK: - JobInfoView Component
struct JobInfoView: View {
    let vacancy: Vacancy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(vacancy.title)
                .fontTitle1()
                .foregroundColor(.uiWhite)
            
            Text(vacancy.salary.full ?? "Уровень дохода не указан")
                .fontText1()
                .foregroundColor(.uiWhite)
            
            Text("Требуемый опыт \(vacancy.experience.text)")
                .fontText1()
                .foregroundColor(.uiWhite)
            
            // Use `joined(separator: ", ")` before calling `formatSchedules`
            Text(vacancy.schedules.joined(separator: ", ").formatSchedules())
                .fontText1()
                .foregroundColor(.uiWhite)
            
            HStack {
                AppliedAndWatchedBlock(imageName: "Откликнулись", number: vacancy.appliedNumber ?? 0, title: "человек уже откликнулись")
                AppliedAndWatchedBlock(imageName: "Смотрят", number: vacancy.lookingNumber ?? 0, title: "человек сейчас смотрят")
            }
        }
    }
}

// MARK: - CompanyInfoView Component
struct CompanyInfoView: View {
    let vacancy: Vacancy
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(vacancy.company)
                    .fontTitle3()
                    .foregroundColor(.uiWhite)
                Image("Check mark")
            }
            Image("map")
                .resizable()
                .frame(height: 100)
            Text("\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)")
                .fontText1()
                .foregroundColor(.uiWhite)
        }
        .padding()
        .background(Color.uiGray1, in: RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: - ResponsibilitiesView Component
struct ResponsibilitiesView: View {
    let vacancy: Vacancy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Ваши Задачи")
                .fontTitle2()
                .foregroundColor(.uiWhite)
            
            Text(vacancy.responsibilities)
                .fontText1()
                .foregroundColor(.uiWhite)
            
            Text("Задайте вопрос работодателю")
                .fontTitle4()
                .foregroundColor(.uiWhite)
            
            Text("Он получит его вместе с откликом на вакансию")
                .fontTitle4()
                .foregroundColor(.uiGray4)
        }
    }
}

// MARK: - QuestionsView Component
struct QuestionsView: View {
    let vacancy: Vacancy
    
    var body: some View {
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
}

// MARK: - Extensions
private extension String {
    func formatSchedules() -> String {
        self.split(separator: ",")
            .enumerated()
            .map { index, schedule in
                index == 0 ? schedule.capitalized : schedule.lowercased()
            }
            .joined(separator: ", ")
    }
}

// MARK: - Preview
struct VacancyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        let previewVacancy: Vacancy = viewModel.allVacancies.first ?? Vacancy(
            id: "",
            lookingNumber: 0,
            title: "Software Engineer",
            address: Vacancy.Address(town: "New York", street: "5th Ave", house: "100"),
            company: "Tech Corp",
            experience: Vacancy.Experience(text: "3-5 years", previewText: ""),
            publishedDate: "",
            isFavorite: false,
            salary: Vacancy.Salary(full: "$100,000 - $120,000", short: nil),
            schedules: ["Full-time", "Remote"],
            appliedNumber: 42,
            description: "An exciting opportunity to work in a dynamic team.",
            responsibilities: "Develop software applications, collaborate with team members.",
            questions: ["What is the company's work culture?", "Are there opportunities for growth?"]
        )
        
        return VacancyDetailsView(vacancy: previewVacancy)
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
