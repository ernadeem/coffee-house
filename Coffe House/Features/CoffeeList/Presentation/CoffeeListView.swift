//
//  CoffeeListView.swift
//  Coffe House
//
//  Created by Nadeem Ahmad on 01/05/26.
//

import SwiftUI


struct CoffeeListView: View {
    
    @StateObject private var coffeeListViewModel: CoffeeListViewModel
    @State private var router = [Router]()
    @State private var searchText:String = ""
    
    init(coffeeListService: CoffeeListService) {
            
        _coffeeListViewModel = StateObject(wrappedValue: CoffeeListViewModel(coffeListService: coffeeListService))
    }
    
    var body: some View  {
        
        NavigationStack(path: $router) {
            
                contentView
                    .navigationTitle("Coffee House")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationDestination(for: Router.self, destination: { router in
                        
                     switch router {
                            
                        case .coffeDetail(let id):
                            
                            Text("Detail View \(id)")
                            
                        default:
                            Text("No data")

                        }
                    })
        }

        .task {
            await coffeeListViewModel.getCoffeeList()
        }
        
        
    }

    @ViewBuilder
    private var contentView: some View {
        
    switch coffeeListViewModel.state {
        
        case .Idle,.loading:
           loaderView
            
        case .success(let coffeeList):
            
           
           listView(coffeeList)
            
        case .failure(_):
            
            errorView
        }
    }
    
    
    private var errorView: some View {
        
        ContentUnavailableView("No Coffee List", systemImage: "tray.fill", description: Text("No coffee list available"))
    }
    
    private var loaderView: some View {
        
        ProgressView("Please wait, loading coffee list")

    }
    
    
  private func listView(_ coffeeList:[Coffee]) -> some View {
        
        List(coffeeList) { coffee in
            
            NavigationLink(value:Router.coffeDetail(id: coffee.id)) {
                
                HStack {
                    CoffeeRowView(coffee: coffee)

                }
            }
        }
        .listStyle(.plain)
        .searchable(text: $searchText, prompt: "search coffee")
         .refreshable {
              await coffeeListViewModel.getCoffeeList()

          }
    }
}


struct CoffeeRowView: View {
    
    let coffee: Coffee
    
    var body: some View {
        
        HStack (alignment: .center,spacing: 14) {
            AsyncImage(url: URL(string: coffee.image)) { image in
            
                image
                    .resizable()
                    .scaledToFill()


               
            
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70,height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack (alignment: .leading,spacing: 6) {
                
                Text(coffee.title)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(coffee.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
            }
        }
    }
}

#Preview("Success") {
    
    CoffeeListView(coffeeListService: MockCoffeeListService())
}

#Preview("error") {
    
    CoffeeListView(coffeeListService: MockCoffeeListService())
}
