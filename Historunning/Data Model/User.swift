//
//  File.swift
//  Historunning
//
//  Created by Matteo Postorino on 08/04/2020.
//  Copyright © 2020 Matteo Postorino. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var UserName = ""
    @objc dynamic var Password = ""
}
