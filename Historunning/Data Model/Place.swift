//
//  Place.swift
//  Historunning
//
//  Created by Matteo Postorino on 31/05/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import Foundation
import RealmSwift

class Place: Object {
    @objc dynamic var Region = ""
    @objc dynamic var Town = ""
}
