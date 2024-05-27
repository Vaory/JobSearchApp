//
//  VerificationView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 04.04.2024.
//
import SwiftUI

struct VerificationView: View {
    
    @ObservedObject private var viewModel = EnteranceViewModel()
    @State var enteredVerificationCode: String = ""
    @FocusState private var isVerificationFieldFocused: Bool
    private let numberOfVerificationFields = 4
      
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Spacer()
            
            HStack {
                Text("Отправили код на \(viewModel.emailAdressText)")
                    .fontTitle2()
                    .foregroundColor(.white)
            }
           
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .fontTitle3()
                .foregroundColor(.white)
    
            
            HStack {
                
                VerifivationFieldView(numberOfFields: numberOfVerificationFields, verificationCode: $enteredVerificationCode)
                    .onChange(of: enteredVerificationCode) { newValue in
                        if newValue.count == numberOfVerificationFields {
                        }
                    }
                    .focused($isVerificationFieldFocused)
            }
            
            Button(action: {
                print("")
            }, label: {
                Text("Подтвердить")
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                    .font(.custom("SFProDisplay-Semibold", size: 14))
                    .foregroundColor(enteredVerificationCode.count < numberOfVerificationFields ? .uiGrey4 : .uiWhite)
                    .background(enteredVerificationCode.count < numberOfVerificationFields  ? Color.uiDarkBlue : Color.uiBlue)
                    .cornerRadius(8)
            }).disabled(enteredVerificationCode.count < numberOfVerificationFields)
            
            Spacer()
        }
        .padding(.horizontal, 17)
        .background(Color.black)
    }
}

struct SecondEnteranceView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
