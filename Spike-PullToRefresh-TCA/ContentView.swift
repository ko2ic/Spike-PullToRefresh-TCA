//
//  ContentView.swift
//  Spike-PullToRefresh-TCA
//
//  Created by koji.ishii on 2021/06/29.
//

import SwiftUI

struct ContentView: View {
    
    @State private var now = Date()
    
    var body: some View {
       RefreshableScrollView(onRefresh: { done in
          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.now = Date()
            done()
          }
        }) {
          VStack {
            ForEach(1..<20) {
              Text("\(Calendar.current.date(byAdding: .hour, value: $0, to: now)!)")
                 .padding(.bottom, 10)
             }
           }.padding()
         }
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

