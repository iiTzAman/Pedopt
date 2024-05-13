//
//  LoginView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-11.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var showIconAnimation = false
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var rememberMeToggle = false
    @State private var goToRegister = false
    @State private var goToMain = false
    
    var body: some View {
        GeometryReader{ geo in
            ZStack(alignment:.top){
                Circle()
                    .frame(width: geo.size.width * 1.5)
                    .foregroundStyle(.accentPurple)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .offset(y: -geo.size.height/1.8)

                VStack{
                    Spacer(minLength: 60)
                    
                    ZStack(alignment:.top) {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "chevron.backward")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                            }
                            .padding(.leading, 35)
                            Spacer()
                        }
                        Image(.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                        .shadow(radius: 4)
                    }
                    Spacer()
                    TextField("Email", text: $emailTextField)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .padding(.horizontal,10)
                        .foregroundStyle(.black)
                        .frame(width: geo.size.width/1.3, height: 60)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                        }
                        .padding(.bottom,10)
                    
                    SecureField("Password", text: $passwordTextField)
                        .font(.title3)
                        .multilineTextAlignment(.leading)
                        .textContentType(.password)
                        .padding()
                        .padding(.horizontal,10)
                        .foregroundStyle(.black)
                        .frame(width: geo.size.width/1.3, height: 60)
                        .overlay{
                            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1)
                        }
                    
                    HStack{
                        Toggle("", isOn: $rememberMeToggle)
                            .labelsHidden()
                            .scaleEffect(0.9)
                        Text("Remember me")
                            .padding(.leading,-18)
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .padding()
                        Spacer()
                        Button{
                            
                        } label: {
                            Text("Forgot Password?")
                                .font(.system(size: 15))
                        }
                    }
                    .padding()
                    .padding(.horizontal,30)
                    
                    Button{
                        goToMain.toggle()
                    } label: {
                        
                        Text("Sign In")
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
                    
                    ZStack{
                        Divider()
                            .background(.black)
                            .frame(height: 2)
                        Text("or Sign in with")
                            .font(.headline)
                            .padding()
                            .background(.white)
                    }
                    .padding(.vertical,15)
                    .padding(.horizontal,40)
                    
                    HStack{
                        Button{
                            
                        } label: {
                            Image(.google)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        Spacer()
                        Button{
                            
                        } label: {
                            Image(.apple)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        Spacer()
                        Button{
                            
                        } label: {
                            Image(.facebook)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    .frame(width: geo.size.width/1.5)
                    
                    HStack{
                        Text("Don't have an account?")
                        Button{
                            goToRegister.toggle()
                        } label: {
                            Text("Register")
                                .font(.headline)
                        }
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear{
            showIconAnimation = true
        }
        .fullScreenCover(isPresented: $goToRegister, content: {
            RegisterView()
        })
        .fullScreenCover(isPresented: $goToMain, content: {
            MainView()
        })
    }
}

#Preview {
    LoginView()
}
