//
//  EmloyerEnterance.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 05.04.2024.
//

import SwiftUI

struct EmployerLogin: View {
    var body: some View {
        Color.uiGray1
            .cornerRadius(8)
            .frame(height: 142)
            .overlay(
                VStack(alignment: .leading) {
                    Text("Поиск cотрудников")
                        .foregroundColor(.uiWhite)
                        .fontTitle3()
                        
                    Spacer()
                        .frame(height: 8)
                    
                    Text("Размещение вакансий и доступ к базе резюме")
                        .foregroundColor(.uiWhite)
                        .fontText1()
                    
                    Spacer()
                        .frame(height: 16)
                    
                    Button {
                       // заглушкa
                    } label: {
                        Text("Я ищу сотрудников")
                            .frame(maxWidth: .infinity)
                            .font(Font.custom("SFProDisplay-Regular", size: 14))
                            .frame(height: 32)
                            .background(Color.uiGreen)
                            .foregroundColor(.uiWhite)
                            .cornerRadius(50)
                    }
                }
                .padding(.horizontal, 17))
    }
}

struct EmployerEnterance_Previews: PreviewProvider {
    static var previews: some View {
        EmployerLogin()
    }
}
