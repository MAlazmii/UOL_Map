import Foundation
import CoreLocation

func mural(_ lat: String, _ lon: String) -> MuralLocation {
    let result = MuralLocation()
    result.lat = lat
    result.lon = lon
    return result
}
let far = mural("53", "0")
let near = mural("51", "0")
let invalid = mural("bad", "0")
let infinite = mural("nan", "0")
let outOfRange = mural("91", "0")
let input = [far, invalid, near, infinite, outOfRange]
let noLocation = MuralLocation.sortedByDistance(input, from: nil)
precondition(zip(input, noLocation).allSatisfy { $0.0 === $0.1 })
let ordered = MuralLocation.sortedByDistance(input, from: CLLocation(latitude: 51, longitude: 0))
precondition(ordered[0] === near && ordered[1] === far)
precondition(ordered[2] === invalid && ordered[3] === infinite && ordered[4] === outOfRange)
let duplicate = mural("51", "0")
let ties = MuralLocation.sortedByDistance([near, duplicate], from: CLLocation(latitude: 51, longitude: 0))
precondition(ties[0] === near && ties[1] === duplicate)
print("Mural ordering regression checks passed")
