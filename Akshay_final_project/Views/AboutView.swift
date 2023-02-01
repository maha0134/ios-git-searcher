//
//  AboutView.swift
//  Akshay_final_project
//
//  Created by AKSHAY MAHAJAN on 2022-11-29.
//

import SwiftUI

struct AboutView: View {
    //MARK: Environment variables for handling orientation changes
    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    var body: some View {
        if (vSizeClass == .regular && hSizeClass == .compact) {
            //portrait mode in phone
            VStack(spacing:15){
                AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/90360626?v=4"))
                Text("Git Searcher v1.0.0").font(.title).fontWeight(.bold)
                HStack{
                    Text("Created by: ")
                    Text("Akshay Mahajan").fontWeight(.bold)
                }
                Text("MAD9137")
                HStack{
                    Image(systemName: "envelope")
                    Text("maha0134@algonquinlive.com")
                }
                HStack{
                    Image(systemName: "globe")
                    Text("https://portfolio-akshay-mahajan.netlify.app/")
                }
                Spacer()
            }.font(.title3)
                .padding()
        }else if(vSizeClass == .regular && hSizeClass == .regular){
            //tablet devices
            VStack(spacing:15){
                AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/90360626?v=4"))
                Text("Git Searcher v1.0.0").font(.title).fontWeight(.bold)
                HStack{
                    Text("Created by: ")
                    Text("Akshay Mahajan").fontWeight(.bold)
                }
                Text("MAD9137")
                HStack{
                    Image(systemName: "envelope")
                    Text("maha0134@algonquinlive.com")
                }
                HStack{
                    Image(systemName: "globe")
                    Text("https://portfolio-akshay-mahajan.netlify.app/")
                }
            }.font(.title3)
                .padding()
        }else{
            //landscape view
                HStack{
                    AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/90360626?v=4"))
                    VStack(spacing:15){
                        Text("Git Searcher v1.0.0").font(.title).fontWeight(.bold)
                        HStack{
                            Text("Created by: ")
                            Text("Akshay Mahajan").fontWeight(.bold)
                        }
                        Text("MAD9137")
                        HStack{
                            Image(systemName: "envelope")
                            Text("maha0134@algonquinlive.com")
                        }
                        HStack{
                            Image(systemName: "globe")
                            Text("https://portfolio-akshay-mahajan.netlify.app/")
                        }
                        Spacer()
                    }.font(.title3)
                        .padding()
                }.padding()
        }
        }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
