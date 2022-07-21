import UIKit

let responseCode = (errorCode: 4010, errorMessage: "Invalid file contents", offset: 0x7fffffffffffffff)

print("responseCode.errorCode: \(responseCode.errorCode)\n")

let responseCode2: (errorCode: Int, errorMessage: String, offset: Double) = (4010, "Invalid file contents", 0x8fffffffffffffff)

print("responseCode2.errorCode: \(responseCode2.errorCode)\n")

func getPartnerList() -> (statusCode: Int, description: String, metaData: (partnerStatusCode: Int, partnerErrorMessage: String, partnerTraceId: String)) {
    //에러 발생
    return (503, "Server Unavailable", (32323, "System is down for maintainance until 2022-7-21T03:30:00+00:00", "5A953D9C-7781-427C-BC00-257B2EB98426"))
}

var result = getPartnerList()
print("result: \(result)\n")
print("result.description: \(result.description)\n")
print("result.metaData.partnerErrorMessage: \(result.metaData.partnerErrorMessage)\n")
print("result.metaData.partnerStatusCode: \(result.metaData.partnerStatusCode)\n")
print("result.metaData.partnerTraceId: \(result.metaData.partnerTraceId)\n")



