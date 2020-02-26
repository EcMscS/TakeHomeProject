//
//  Network.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/26/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

class Network {
	
	static func createAccount(cellPhoneNumber: String, completion: @escaping (_ data: UserAuth)->()) {
		
		let sessionConfig = URLSessionConfiguration.default
		let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
		
		guard let URL = URL(string: "http://ios-test-proj.mizo.co/sign_in") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "POST"

        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

        let bodyObject: [String : Any] = [
            "phone_number": "\(cellPhoneNumber)"
        ]
        request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])


		let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
			if (error == nil) {
				// Success
				let statusCode = (response as! HTTPURLResponse).statusCode
				print("URL Session Task Succeeded: HTTP \(statusCode)")
							
				guard let data = data else {
				print("Error with data")
				return
				}
				
				do {
					let decoder = JSONDecoder()
					let userData = try decoder.decode(UserAuth.self, from: data)
					completion(userData)
				} catch {
					print(error.localizedDescription)
				}
				
			}
			else {
				print("URL Session Task Failed: %@", error!.localizedDescription)
			}
		})
		task.resume()
		session.finishTasksAndInvalidate()
	}
	
	static func fetchPreviewListData(completion: @escaping (_ data: [PreviewListItem])->()) {
		
		let sessionConfig = URLSessionConfiguration.default
		let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
		
		guard let URL = URL(string: "http://ios-test-proj.mizo.co/preview_load") else {return}
		var request = URLRequest(url: URL)
		request.httpMethod = "GET"
		
		request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")

		let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
			if (error == nil) {
				// Success
				let statusCode = (response as! HTTPURLResponse).statusCode
				print("URL Session Task Succeeded: HTTP \(statusCode)")
							
				guard let data = data else {
				print("Error with data")
				return
				}
				
				do {
					let decoder = JSONDecoder()
					let previewListData = try decoder.decode([PreviewListItem].self, from: data)
					completion(previewListData)
				} catch {
					print(error.localizedDescription)
				}
				
			}
			else {
				print("URL Session Task Failed: %@", error!.localizedDescription)
			}
		})
		task.resume()
		session.finishTasksAndInvalidate()
	}
	
	
	
}

protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {

    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}

extension URL {
    
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}

