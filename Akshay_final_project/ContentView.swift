//
//  ContentView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import SwiftUI
import Alamofire
import ToastSwiftUI

struct ContentView: View {
    //MARK: properties
    @State var aboutViewIsPresenting = false
    @State var settingsViewIsPresenting = false
    @State var searchViewIsPresenting = false
    @State var noResultsError = false
    @State var loading = false
    @State var userList = [User]()
    @State var searchText = ""
    @State private var toastMessage: String?
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Git Searcher").font(.title)
                HStack{
                    TextField("Enter name", text: $searchText)
						.autocorrectionDisabled()
						.textInputAutocapitalization(.never)
                        .onChange(of: searchText, perform:{ _ in
                            noResultsError = false
                        }).textFieldStyle(.roundedBorder)
                        .border(.gray)
                    Button(action:{
                        if(!searchText.isEmpty){
                            searchGitHub(search:searchText)
                        }
                    },label: {
                        Image(systemName: "magnifyingglass").bold().font(.title2)
                    }).frame(width: 45,height: 40)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }.frame(width: 250)
                    .padding()
                if(noResultsError){
                    Text("No results found. Please try another name").foregroundColor(.red)
                }
                if(loading){
                    ProgressView()
                }
                Spacer()
                
            }.padding()
                .toast($toastMessage)
            .navigationDestination(isPresented: $settingsViewIsPresenting, destination:{
                AppSettingsView()
            })
            .navigationDestination(isPresented: $aboutViewIsPresenting, destination:{
                AboutView()
            })
            .navigationDestination(isPresented: $searchViewIsPresenting, destination:{
                UserSearchResultsView(userList: userList)
            })
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action:{
                        settingsViewIsPresenting.toggle()
                    },label:{
                        Image(systemName:"gear").font(.title2)
                    })
                })
                ToolbarItem(placement:.navigationBarLeading, content:{
                    Button(action:{
                        aboutViewIsPresenting.toggle()
                    },label:{
                        Image(systemName: "person.crop.circle.fill").font(.title2)
                    })
                })
            })
        }
    }
}

extension ContentView{
    //MARK: Method
    func searchGitHub(search:String){
        //Set the progressView
        loading = true
        
        //Get at user defaults
        //MARK: property wrappers
        @AppStorage("resultsPerPage") var resultsPerPage: Int = 30
        @AppStorage("minimumRepos") var minimumRepos: Int = 0
        @AppStorage("minimumFollowers") var minimumFollowers: Int = 0
        
        //MARK: properties
        var myUrlComponents = URLComponents(string: "https://api.github.com")!
        let additionalParameters = "+followers:>\(minimumFollowers)+repos:>\(minimumRepos)"
        let searchQuery = URLQueryItem(name: "q", value: "\(search)\(additionalParameters)")
        let resultsPerPageQuery = URLQueryItem(name: "per_page", value: "\(resultsPerPage)")

        myUrlComponents.queryItems = [searchQuery,resultsPerPageQuery]
        myUrlComponents.path = "/search/users"
        
        AF.request(myUrlComponents)
            .downloadProgress{status in
                if(status.isFinished){
                    loading = false
                }
            }
            .validate(statusCode: 200..<300)
            .responseDecodable(of:UserResponseModel.self){
            response in
                switch response.result{
                case .failure(let err):
                    if let msg = err.errorDescription{
                        toastMessage = msg
                    }else{
                        toastMessage = "something went wrong"
                    }
                case .success(let value):
                    if value.data.count > 0 {
                        self.userList = value.data
                        DispatchQueue.main.async {
                            searchViewIsPresenting.toggle()
                        }
                    }else{
                        noResultsError = true
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
