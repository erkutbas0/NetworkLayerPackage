//
//  SampleEventMonitorModule.swift
//  NetworkLayerPackage
//
//  Created by Erkut Bas on 29.03.2021.
//

import Foundation
import Alamofire

public class SampleEventMonitorModule: EventMonitor {
    
    public init() {
        
    }

    public func request(_ request: DataRequest, didParseResponse response: DataResponse<Data?, AFError>) {
        print("didParseResponse fired")
    }
    
}
