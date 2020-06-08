//
//  Grid.swift
//  Memorize
//
//  Created by Javier Contreras on 6/8/20.
//  Copyright © 2020 Javier Contreras. All rights reserved.
//

import SwiftUI

struct Grid<Item>: View {
    var items: [Item]
    var viewForItems (Item) -> ItemView
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
