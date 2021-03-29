//
//  EventMonitoringDelegate.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 29.03.2021.
//

import Foundation
import Alamofire

public protocol EventMonitoringDelegate: EventMonitor {
    
    var eventMonitoringModules: [EventMonitor] { get }
    
}
