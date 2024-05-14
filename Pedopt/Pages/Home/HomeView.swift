//
//  HomeView.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-13.
//

import SwiftUI

struct HomeView: View {
    
    enum Location: String, CaseIterable, Identifiable {
        case London = "London, ON", Toronto = "Toronto, ON", Calgary = "Calgary, AB"
        var id: Self { self }
    }
    
    @Binding var selectedView: SelectedView
    
    @State private var currentCategory: PetCategoryModel = .all
    @State private var selectedLocation: Location = .London
    @State private var searchText = ""
    @State private var showFilters = false
    
    var reorderedCategories: [PetCategoryModel] {
        var categories = Array(PetCategoryModel.allCases)
        if let index = categories.firstIndex(of: currentCategory) {
            categories.remove(at: index)
            categories.insert(currentCategory, at: 0)
        }
        return categories
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                
                // MARK: Header
                ZStack(alignment:.top){
                    Rectangle()
                        .frame(width: geo.size.width, height: 50)
                        .foregroundStyle(.accentPurple)
                    Circle()
                        .frame(width: 185)
                        .foregroundStyle(.accentPurple)
                        .padding(.top,-40)
                    
                    Image(.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.top,55)
                }
                
                VStack{
                    
                    // MARK: Search
                    HStack{
                        ZStack(alignment:.trailing){
                            TextField("Search", text: $searchText)
                                .font(.title3)
                                .multilineTextAlignment(.leading)
                                .textInputAutocapitalization(.never)
                                .padding()
                                .padding(.leading,5)
                                .padding(.trailing,30)
                                .foregroundStyle(.black)
                                .frame(width: geo.size.width/1.45, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .background(.accentGray)
                            Button{
                                
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.gray)
                                    .padding(.trailing,15)
                            }
                        }
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 50, height: 50)
                                .foregroundStyle(showFilters ? .accentYellow : .gray)
                            Button{
                                withAnimation(.easeOut){
                                    showFilters.toggle()
                                }
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    
                    // MARK: Categories
                    if showFilters {
                        ScrollView(.horizontal){
                            HStack(spacing:15) {
                                ForEach(reorderedCategories, id: \.self){
                                    pet in
                                    if pet == currentCategory{
                                        Button{
                                            
                                        } label: {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 25)
                                                    .frame(width: 80, height: 80)
                                                    .foregroundStyle(.accentPink)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 25).stroke(lineWidth: 8).fill(Color.selectedCatShadow)
                                                    )
                                                    .padding(.trailing,5)
                                                Image(pet.petSelectedIcon)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width:25)
                                                    .offset(y:-10)
                                                Text("\(pet.name.capitalized)")
                                                    .offset(y: 20)
                                                    .foregroundStyle(.white)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                            }
                                        }
                                    } else {
                                        Button{
                                            withAnimation(.bouncy(duration: 1)){
                                                currentCategory = pet
                                            }
                                        } label: {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 25)
                                                    .frame(width: 85, height: 85)
                                                    .foregroundStyle(.accentGray)
                                                Image(pet.petDefaultIcon)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width:25)
                                                    .offset(y:-10)
                                                Text("\(pet.name.capitalized)")
                                                    .offset(y: 22)
                                                    .foregroundStyle(.accentPurple)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.semibold)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(8)
                            
                        }
                        .padding(.vertical,10)
                        .scrollIndicators(.hidden)
                    }
                    
                    // MARK: Results
                    VStack{
                        Divider()
                            .frame(height: 0.5)
                            .background(.accentGray)
                            .padding(.vertical,10)
                        HStack{
                            Text("Showing results")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Spacer()
                            Picker("Location", selection: $selectedLocation) {
                                ForEach(Location.allCases) { location in
                                    Text(location.rawValue)
                                }
                            }
                            .offset(x: 5)
                        }
                        
                        ScrollView(.vertical){
                            ForEach(0..<10){ item in
                                HStack(spacing:2){
                                    //Card
                                    VStack{
                                        Text("Pet Name")
                                            .padding(.vertical,10)
                                        Divider()
                                        HStack{
                                            Text("Pug")
                                            Spacer()
                                            Text("2 years old")
                                        }
                                        .padding(10)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                        
                                        HStack{
                                            Text("Female")
                                            Spacer()
                                            HStack{
                                                Image(systemName: "mappin.circle.fill")
                                                    .foregroundStyle(.red)
                                                Text("~ 3.6km")
                                            }
                                        }
                                        .padding(10)
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                    }
                                    .padding(10)
                                    .zIndex(1.5)
                                    .overlay {
                                        Rectangle()
                                            .strokeBorder(.white,lineWidth: 1,antialiased: false)
                                            .shadow(radius: 1)
                                            .zIndex(1)
                                    }
                                    
                                    
                                    //Pet Image
                                    Image("pet1")
                                        .resizable()
                                        .scaledToFill()
                                        .overlay(RoundedRectangle(cornerRadius: 6).strokeBorder(.white,lineWidth: 8, antialiased: true))
                                        .frame(width: 150, height: 140)
                                        .shadow(radius: 3)
                                        .zIndex(1)
                                    
                                }
                                .padding(.vertical,30)
                                .padding(.horizontal,30)
                                Divider()
                                    .frame(height: 0.5)
                                    .background(.accentGray)
                                    .padding(.vertical,10)
                                    .padding(.horizontal,30)
                            }
                            
                        }
                        .padding(.vertical,10)
                        .frame(width: geo.size.width)
                    }
                    .padding(.bottom,40)
                }
                .padding(.horizontal,30)
                
            }
            .frame(width: geo.size.width)
        }
        .ignoresSafeArea()
        .onAppear{
            selectedView = .home
        }
    }
}

#Preview {
    HomeView(selectedView: .constant(.home))
}
