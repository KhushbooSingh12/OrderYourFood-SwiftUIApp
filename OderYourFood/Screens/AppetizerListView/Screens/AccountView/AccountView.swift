//
//  AccountView.swift
//  OderYourFood
//
//  Created by Khushi singh on 14/03/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var accountViewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField {
        case firstName,lastName,email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $accountViewModel.user.userName)
                        .focused($focusedTextField,equals: .firstName)
                        .onSubmit {focusedTextField = .lastName}
                        .submitLabel(.next)
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                        .focused($focusedTextField,equals: .lastName)
                        .onSubmit {focusedTextField = .email}
                        .submitLabel(.next)
                    TextField("Email", text: $accountViewModel.user.email)
                        .focused($focusedTextField,equals: .email)
                        .submitLabel(.continue)
                        .onSubmit {focusedTextField = nil}
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $accountViewModel.user.birthdayDate, displayedComponents: .date)
                    Button {
                        accountViewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Request")) {
                    Toggle("Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
                    Toggle("Frequently Refills", isOn: $accountViewModel.user.frequentRefills)
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
            }
            .navigationTitle("😀 Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {focusedTextField = nil }
                }
            }
        }
        .onAppear {
            accountViewModel.retriveUSer()
        }
        .alert(item: $accountViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AccountView()
}
