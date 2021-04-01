//
//  SwiftUILineView.swift
//  ProtocolAFPEexample
//
//  Created by yoko on 11/03/2021.
//

import Foundation
import SwiftUI
//import Combine

struct LineView2: View {
    var data: [(Double)]
    var title: String?
    var price: String?

    public init(data: [Double],
                title: String? = nil,
                price: String? = nil) {
        
        self.data = data
        self.title = title
        self.price = price
    }
    
    public var body: some View {
        GeometryReader{ geometry in
            //VStack(alignment: .leading, spacing: 8) {
                /* by Yoko
                Group{
                    if (self.title != nil){
                        Text(self.title!)
                            .font(.title)
                    }
                    if (self.price != nil){
                        Text(self.price!)
                            .font(.body)
                        .offset(x: 5, y: 0)
                    }
                }.offset(x: 0, y: 0)
                */
                //ZStack{
                VStack {
                    GeometryReader{ reader in
                        Line(data: self.data,
                             frame: .constant(CGRect(x: 0, y: 0,
                                    width: reader.frame(in: .local).width ,
                                    height: reader.frame(in: .local).height))//,
                             //minDataValue: .constant(nil),
                             //maxDataValue: .constant(nil)
                        )
                        //.offset(x: 0, y: 0)
                    }
                    .frame(
                        width: geometry.frame(in: .local).size.width ,
                        height: geometry.frame(in: .local).size.height * 1.0)
                        //height: 200)
                        //.offset(x: 0, y: -100)

                }
                .frame(
                    width: geometry.frame(in: .local).size.width ,
                    height: geometry.frame(in: .local).size.height * 1.0)
                    //height: 200)
        
            //}
        }
    }
}
