//
//  RegisterView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-12.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel = RegisterViewModel()
    
    @State private var showLoginPage = false
    @State private var isEmailValid : Bool = true

    
    var body: some View {
        GeometryReader{ geo in
            VStack{
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.white)
                            .font(.title)
                    }
                    .padding(.leading, 15)
                    Text("Create Account")
                        .font(.system(size: 23))
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.leading,-15)
                }
                .padding()
                .padding(.top,40)
                .frame(height: 130)
                .background(.accentPurple)
                Text("Get Started")
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .padding(.top,30)
                HStack{
                    TextField("First Name", text: $viewModel.first)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.5)
                        .textContentType(.givenName)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.horizontal,10)
                        .foregroundStyle(.black)
                        .frame(width: geo.size.width/2.8, height: 60)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).fill(viewModel.first == "" ? .black : Color(viewModel.borderFirst))
                        }
                        .padding(.vertical,10)
                    Spacer()
                    TextField("Last Name", text: $viewModel.last)
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.5)
                        .textContentType(.familyName)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.horizontal,10)
                        .foregroundStyle(.black)
                        .frame(width: geo.size.width/2.8, height: 60)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).fill(viewModel.last == "" ? .black : Color(viewModel.borderLast))
                        }
                        .padding(.vertical,10)
                }
                .frame(width: geo.size.width/1.3)
                .padding(.top,10)
                
                TextField("Email", text: $viewModel.email)
                    .multilineTextAlignment(.leading)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).fill(viewModel.email == "" ? .black : Color(viewModel.borderEmail))
                    }
                    .padding(.bottom,10)
                SecureField("Password", text: $viewModel.password)
                    .multilineTextAlignment(.leading)
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).fill(viewModel.password == "" ? .black : Color(viewModel.borderPass))
                    }
                    .padding(.bottom,10)
                
                SecureField("Confirm Password", text: $viewModel.confirmPass)
                    .multilineTextAlignment(.leading)
                    .textContentType(.newPassword)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).fill(viewModel.confirmPass == "" ? .black : Color(viewModel.borderConfPass))
                    }
                    .padding(.bottom,10)
                
                TextField("Contact", text: $viewModel.contact)
                    .multilineTextAlignment(.leading)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.numberPad)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .padding(.horizontal,10)
                    .foregroundStyle(.black)
                    .frame(width: geo.size.width/1.3, height: 60)
                    .overlay{
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).fill(viewModel.contact == "" ? .black : Color(viewModel.borderContact))
                    }
                VStack{
                        Text("\(viewModel.error)")
                            .foregroundStyle(.red)
                }
                .frame(height: 30)
                .padding(.bottom,10)
                Button{
                    viewModel.checkAllFieldsFilled()
                    if viewModel.filledAll {
                        showLoginPage = true
                    }
                } label: {
                    Text("Register")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .frame(width: geo.size.width/1.45)
                        .padding()
                        .background(.accentPink)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                        .transition(.blurReplace)
                }
                
                HStack{
                    Text("Already have an account?")
                    Button{
                        showLoginPage.toggle()
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                    }
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showLoginPage, content: {
            LoginView()
        })
    }
}

#Preview {
    RegisterView()
}
