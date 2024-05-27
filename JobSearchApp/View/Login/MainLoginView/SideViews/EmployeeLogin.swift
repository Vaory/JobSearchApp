//
//  EmployeeEnterance.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 04.04.2024.
//

import SwiftUI

struct EmployeeLogin: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject private var coordinator: Coordinator

    @State private var isEmailCorrect = true
    @State private var showingClearButton = false
    var emailText: String = ""
    
    private let errorText = Text("Введен неправильный e-mail")
        .font(.system(size: 14))
        .foregroundColor(.uiRed)
        
    var body: some View {
        
        ZStack {
            Color.uiGray1
                .cornerRadius(8)
                .frame(height: 179)
                .overlay(
                    VStack (alignment: .leading) {
                        
                        Text("Поиск работы")
                            .foregroundColor(.uiWhite)
                            .font(Font.custom("SFProDisplay-Regular", size: 24))
                            .multilineTextAlignment(.leading)
                        
                        ZStack {
    
                            TextField("", text: $viewModel.emailAdressText)
                                .offset(x:10)
                                .foregroundColor(.uiWhite)
                                .frame(height: 40)
                                .font(Font.custom("SFProDisplay-Regular", size: 14))
                                .autocorrectionDisabled()
                                .foregroundColor(.uiWhite)
                                .colorScheme(.dark)
                                .background(Color.uiGray2)
                                .cornerRadius(8)
                                .onChange(of: viewModel.emailAdressText) { newValue in
                                    isEmailCorrect = viewModel.emailValidation(email: newValue)
                                }
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(isEmailCorrect ? Color.clear : Color.uiRed, lineWidth: 1)
                                )
                            
                            HStack {
                                Group {
                                    if viewModel.emailAdressText.isEmpty {
                                        Image("Отклики")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                        
                                        Spacer().frame(width: 8)
                                        
                                        Text("Электронная почта или телефон")
                                            .font(Font.custom("SFProDisplay-Regular", size: 14))
                                            .foregroundColor(.uiGray4)
                                    }
                                }.allowsHitTesting(false)
                                
                                Spacer()
                                
                                if !viewModel.emailAdressText.isEmpty {
                                    Button(action: {
                                        viewModel.emailAdressText = ""
                                    }) {
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .frame(width: 17, height: 17)
                                            .foregroundColor(.gray)
                                    }
                                }
                            }
                            .padding(.trailing, 16)
                            .padding(.leading, 8)
                        }
                        
                        if !isEmailCorrect && !viewModel.emailAdressText.isEmpty {
                            errorText
                        }
                        
                        HStack {
                            
                            Button(action: {
                                isEmailCorrect = viewModel.emailValidation(email: viewModel.emailAdressText)

                                if isEmailCorrect {
                                    coordinator.changeTab(to: .verifying)
                                }
                                
                            }, label: {
                                Text("Продолжить")
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 40)
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                                    .foregroundColor(viewModel.emailAdressText.isEmpty ? .uiGray4 : .uiWhite)
                                    .background(viewModel.emailAdressText.isEmpty ?
                                                Color.uiDarkBlue : Color.uiBlue)
                                    .cornerRadius(8)
                            }).disabled(viewModel.emailAdressText.isEmpty)
                            
                            Button(action: {
                                print("")
                            }, label: {
                                Text("Войти с паролем")
                                    .font(Font.custom("SFProDisplay-Regular", size: 14))
                            }) .padding(.leading, 24)
                        }.multilineTextAlignment(.trailing)
                    }.padding(.horizontal, 17))
        }
          
    }
    
}

struct EmployeeLogin_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeLogin()
    }
}
