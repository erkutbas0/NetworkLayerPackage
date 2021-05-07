//
//  ApiDefaultEventMonitoringManager.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 26.03.2021.
//

import Foundation
import Alamofire

final public class ApiDefaultEventMonitoringManager: EventMonitoringDelegate {
    
    private let sampleEventMonitorModule: SampleEventMonitorModule
    
    public init(sampleEventMonitorModule: SampleEventMonitorModule) {
        self.sampleEventMonitorModule = sampleEventMonitorModule
    }
    
    public var eventMonitoringModules: [EventMonitor] {
        return [sampleEventMonitorModule]
    }
    
}
