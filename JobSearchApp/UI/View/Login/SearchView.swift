//
//  SearchView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 10.04.2024.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject private var coordinator: CoordinatorViewModel
    @EnvironmentObject private var viewModel: AppViewModel
    
    @State private var text = ""
    
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack {
                ZStack {
                    TextField("", text: $text)
                        .offset(x:10)
                        .foregroundColor(.uiWhite)
                        .frame(height: 40)
                        .font(Font.custom("SFProDisplay-Regular", size: 14))
                        .autocorrectionDisabled()
                        .foregroundColor(.uiWhite)
                        .colorScheme(.dark)
                        .background(Color.uiGray2)
                        .cornerRadius(8)
                        .disabled(true)
                    
                    HStack {
                        Image("Поиск")
                        
                        Spacer().frame(width: 8)
                        
                        Text("Должность, ключевые слова")
                            .fontText1()
                            .foregroundColor(.uiGray4)
                        Spacer()
                    }
                    .allowsHitTesting(false)
                    .padding(.leading, 8)
                }
                
                Spacer()
                    .frame(width: 8)
                
                Image("searchFilter")
            }
            
            Spacer().frame(height: 16)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    
                    RecomendationBlock(imageName: "Вакансии рядом", title: "Вакансии рядом с вами")
                    
                    RecomendationBlock(imageName: "Поднять резюме", title: "Подинять резюме в поиске", buttonTitle: "Полнять")
                    
                    RecomendationBlock(imageName: "Временная работа", title: "Временная работа и подработка")
                }
            }
            .scrollIndicators(.never)
            
            Text("Вакансии для вас")
                .fontTitle2()
                .foregroundStyle(.white)
                .padding(.top, 16)
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(viewModel.allVacancies.prefix(3), id: \.id) { vacancy in
                        VacancyPreview(vacancy: vacancy)
                        
                        Spacer().frame(height: 8)
                    }
                    
                    Spacer().frame(height: 16)
                    
                    Button(action: {
                        print()
                    }) {
                        Text("Еще \(viewModel.allVacancies.count) \(viewModel.pluralize(viewModel.allVacancies.count, "вакансия","вакансии","вакансий"))")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("SFProDisplay-Semibold", size: 16))
                            .frame(height: 48)
                            .background(Color.uiBlue)
                            .foregroundColor(.uiWhite)
                            .cornerRadius(8)
                            .padding(.bottom, 8)
                    }
                }
            }
            .scrollIndicators(.never)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.uiBlack)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(AppViewModel())
    }
}
