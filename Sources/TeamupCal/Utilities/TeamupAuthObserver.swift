//
//  TeamupAuthObserver.swift
//  TeamupCal
//
//  Created by Merrick Sapsford on 22/11/2017.
//  Copyright © 2017 AMRAP Labs. All rights reserved.
//

import Foundation
import TeamupKit

internal protocol TeamupAuthObserverDelegate: class {
    
    func authObserver(_ observer: TeamupAuthObserver, didObserveAuthenticationWith user: User)
    
    func authObserver(didObserveSignOut observer: TeamupAuthObserver)
}

internal class TeamupAuthObserver {
    
    // MARK: Properties
    
    weak var delegate: TeamupAuthObserverDelegate?
    
    // MARK: Init
    
    init() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(teamupDidAuthenticate(_:)),
                                       name: .TeamupAuthenticationDidLogIn, object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(teamupDidAuthenticate(_:)),
                                       name: .TeamupAuthenticationDidRegister, object: nil)
        notificationCenter.addObserver(self,
                                       selector: #selector(teamupDidSignOut(_:)),
                                       name: .TeamupAuthenticationDidSignOut, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Notifications
    
    @objc private func teamupDidAuthenticate(_ notification: Notification) {
        guard let user = notification.userInfo?["user"] as? User else {
            return
        }
        delegate?.authObserver(self, didObserveAuthenticationWith: user)
    }
    
    @objc private func teamupDidSignOut(_ notification: Notification) {
        delegate?.authObserver(didObserveSignOut: self)
    }
}
