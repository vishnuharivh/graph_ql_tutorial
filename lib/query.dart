class QueryMutation{
  getOTP() {
    return """
mutation getOtp(\$phone: String!) {
getOtp(phone: \$phone){
    otp
    timer
  }
}""";
  }
}