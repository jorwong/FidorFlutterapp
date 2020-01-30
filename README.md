# FidorFlutterapp
# fidortry

PREREQUISITE
- Make sure you have 

First get the authorization code from the 'http://apm.sandbox-test.fidorfzco.com/oauth/authorize?client_id={clientid}&redirect_uri={Redirect_Uri}&response_type=code&state=approved'. Replace the clientid and redirect uri accordingly. 

After which pass in your authorization code into lib/Provider/class.dart in the getToken block. 

You will also have to make changes to the 
" final response = await http.post('http://apm.sandboxpresales.fidorfzco.com/oauth/token?grant_type=authorization_code&client_id=2d9f97613542093e&client_secret=1f527b70f6c8dc24e7f8e44b8a7cd5b7&code='+code+'&redirect_uri=http://localhost:3000/OAuth2callback'); " within the getToken block in lib/Provider/class.dart

Once the modifications are saved, you can run the application.


