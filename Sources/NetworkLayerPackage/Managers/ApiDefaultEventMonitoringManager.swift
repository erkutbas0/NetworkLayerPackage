//
//  ApiDefaultEventMonitoringManager.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire

final public class ApiDefaultEventMonitoringManager: EventMonitoringDelegate {
    
    public init() {
        
    }
    
    public var eventMonitoringModules: [EventMonitor] {
        return [SampleEventMonitorModule()]
    }
    
}
