//
//  DecimalTextField.swift
//  Lista
//
//  Created by Jaime Jazareno III on 7/2/21.
//

import SwiftUI
import Combine

struct DecimalTextField: View {
    public let placeHolder: String
    @Binding var numericValue: Double
    private class DecimalTextFieldViewModel: ObservableObject {
        @Published var text = "" {
            didSet{
                DispatchQueue.main.async { [weak self] () in
                    guard let self = self else { return }
                    let substring = self.text.split(separator: Character("."), maxSplits: 2)
                    if substring.isEmpty {
                        if self.numericValue != 0 {
                            self.numericValue = 0
                        }
                    } else if substring.count == 1 {
                        var newValue: Double = 0
                        if let lastChar = substring[0].last {
                            let ch = String(lastChar)
                            if ch == "." {
                                newValue = Double(String(substring[0]).dropLast()) ?? 0
                            } else{
                                newValue = Double(String(substring[0])) ?? 0
                            }
                        }
                        if self.numericValue != newValue {
                            self.numericValue = newValue
                        }
                    } else {
                        let newValue = Double(String("\(String(substring[0])).\(String(substring[1]))")) ?? 0
                        if self.numericValue != newValue {
                            self.numericValue = newValue
                        }

                    }
                }
            }
        }

        private var subCancellable: AnyCancellable!
        private var validCharSet = CharacterSet(charactersIn: "1234567890.")
        @Binding private var numericValue: Double {
            didSet{
                DispatchQueue.main.async { [weak self] () in
                    guard let self = self else { return }
                    if String(self.numericValue) != self.text {
                        self.text = String(self.numericValue)
                    }
                }
            }
        }
        init(numericValue: Binding<Double>, text: String) {
            self.text = text
            self._numericValue = numericValue
            subCancellable = $text.sink { val in
                // check if the new string contains any invalid characters
                if val.rangeOfCharacter(from: self.validCharSet.inverted) != nil {
                    // clean the string (do this on the main thread to avoid overlapping with the current ContentView update cycle)
                    DispatchQueue.main.async { [weak self] () in
                        guard let self = self else { return }
                        self.text = String(self.text.unicodeScalars.filter {
                            self.validCharSet.contains($0)
                        })
                    }
                }
            }
        }

        deinit {
            subCancellable.cancel()
        }
    }

    @ObservedObject private var viewModel: DecimalTextFieldViewModel

    init(_ placeHolder: String = "", numericValue: Binding<Double>){
        self._numericValue = numericValue
        self.placeHolder = placeHolder
        self.viewModel  = DecimalTextFieldViewModel(numericValue: self._numericValue, text: getTextOn(double: numericValue.wrappedValue))
    }
    var body: some View {
        TextField(placeHolder, text: $viewModel.text)
            .keyboardType(.decimalPad)
    }
}

fileprivate func getTextOn(double: Double) -> String{
    let rounded = double - Double(Int(double)) == 0
    var result = ""
    if double != Double.zero{
        result = rounded ? String(Int(double)) : String(double)
    }
    return result
}

struct DecimalTextField_Previews: PreviewProvider {
    static var previews: some View {
        DecimalTextField("", numericValue: .constant(123))
    }
}
