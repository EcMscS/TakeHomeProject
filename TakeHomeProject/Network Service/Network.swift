//
//  Network.swift
//  TakeHomeProject
//
//  Created by Arin Davoodian on 2/26/20.
//  Copyright © 2020 Arin Davoodian. All rights reserved.
//

import Foundation

class Network {
	
	static func sendRequest() {
		
		let sessionConfig = URLSessionConfiguration.default
		let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
		
		guard var URL = URL(string: "http://ios-test-proj.mizo.co/load") else {return}
		let URLParams = [
			"item_id": "test_id_3",
		]
		
		URL = URL.appendingQueryParameters(URLParams)
		var request = URLRequest(url: URL)
		request.httpMethod = "GET"

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
					let user = try decoder.decode(Item.self, from: data)
					print(user.deliveryServices[0].eta?.max)
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

