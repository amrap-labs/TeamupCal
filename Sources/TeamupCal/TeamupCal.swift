//
//  TeamupCal.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 14/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

public class TeamupCal {
    
    // MARK: Properties
    
    private weak var teamup: Teamup?
    
    // MARK: Init
    
    public init(with teamup: Teamup) {
        self.teamup = teamup
    }
}
