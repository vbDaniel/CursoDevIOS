import UIKit

var travels: [Dictionary<String,String>] = []
var travel: Dictionary<String, String> = [:]

travel = ["local": "Cristo Redentor", "latitude": "10", "longitude": "10"]
travels.append(travel)

print(travels[0]["local"])
