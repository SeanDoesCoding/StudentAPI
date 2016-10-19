//
//  StudentController.swift
//  StudentAPI
//
//  Created by Sean Gleason on 10/19/16.
//  Copyright © 2016 SeanGleason. All rights reserved.
//

import Foundation


class StudentController {
    
    static let baseURL = URL(string: "https://names-e4301.firebaseio.com/students")
    
    static let getterEndpoint = baseURL?.appendPathExtension("json")
    
    // Methods
    static func send(studentWithName name: String, completion: ((_ success: Bool) -> Void)? = nil) {
        
        // Create a student instance
        let student = Student(name: name)
        
        // Add the student name to the URL
        let url = baseURL?.appendingPathComponent(name).appendingPathExtension("json")
        
        // Call NetworkController to send data to Firebase
        NetworkController.performRequest(for: url, httpMethod: .Put, body: Student.jsonData) { (data, error) in
            
            var success = false
            
            defer {
                
                if let completion = completion {
                    completion(success)
                }
            }
            
            guard let responseDataString = String(data: data!, encoding: .utf8) else { return }
            
            if let error = error {
                NSLog("Error: \(error.localizedDescription)")
                return
            } else if responseDataString.contains("error") {
                
                NSLog("Error: \(responseDataString)")
            } else {
                
                print("Successfully saved data to the endpoint.  \nResponse: \(responseDataString)")
                success = true
            }
        }
        
        // See whether or not it worked
        
        
    }
}
