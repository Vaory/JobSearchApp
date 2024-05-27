//
//  VerifivationFieldView.swift
//  JobSearchApp
//
//  Created by Mikhail Demichev on 05.04.2024.
//


import SwiftUI
import Combine

struct VerifivationFieldView: View {
    
    @FocusState private var pinFocusState: FocusPin?
    @Binding private var verificationCode: String
    @State private var pins: [String]
    
    var numberOfFields: Int
    
    enum FocusPin: Hashable {
        case pin(Int)
    }
    
    init(numberOfFields: Int, verificationCode: Binding<String>) {
        self.numberOfFields = numberOfFields
        self._verificationCode = verificationCode
        self._pins = State(initialValue: Array(repeating: "", count: numberOfFields))
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("*", text: $pins[index])
                    .frame(width: 60, height: 60)
                    .modifier(VerificationFieldModifier(pin: $pins[index]))
                    .onChange(of: pins[index]) { newVal in
                        if newVal.count == 1 {
                            if index < numberOfFields - 1 {
                                pinFocusState = FocusPin.pin(index + 1)
                            }
                        }
                        else if newVal.count == numberOfFields, let _ = Int(newVal) {
                            verificationCode = newVal
                            updatePinsFromVerificationFields()
                            pinFocusState = FocusPin.pin(numberOfFields - 1)
                        }
                        else if newVal.isEmpty {
                            if index > 0 {
                                pinFocusState = FocusPin.pin(index - 1)
                            }
                        }
                        updateVerificationField()
                    }
                    .focused($pinFocusState, equals: FocusPin.pin(index))
                    .onTapGesture {
                        pinFocusState = FocusPin.pin(index)
                    }
            }
        }
        .onAppear {
            updatePinsFromVerificationFields()
        }
    }
    
    private func updatePinsFromVerificationFields() {
        let verificationArray = Array(verificationCode.prefix(numberOfFields))
        for (index, char) in verificationArray.enumerated() {
            pins[index] = String(char)
        }
    }
    
    private func updateVerificationField() {
        verificationCode = pins.joined()
    }
}

struct VerificationFieldModifier: ViewModifier {
    @Binding var pin: String
    
    var textLimit = 1
    
    func limitText(_ maxNumber: Int) {
        if pin.count > maxNumber {
            self.pin = String(pin.prefix(maxNumber))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .onReceive(Just(pin)) { _ in limitText(textLimit) }
            .keyboardType(.numberPad)
            .foregroundColor(.uiWhite)
            .colorScheme(.dark)
            .background(Color.uiGrey2)
            .cornerRadius(8)
            .font(.system(size: 25))
            .onReceive(Just(pin)) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    self.pin = filtered
                }
                limitText(textLimit)
            }
    }
}

struct VerifivationFieldView_Previews: PreviewProvider {
    static var previews: some View {
        VerifivationFieldView(numberOfFields: 4, verificationCode: VerificationView().$enteredVerificationCode)
    }
}
