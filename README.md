# AD-registration-and-Oauth-token-
This script helps to perform a simple Azure AD app registration and generate the token for OAuth Authentication

Provide the display name for the app reigstration as a parameter
You can modify the script to provide Identifier URL and other onwers to the app.

This script creates an app registration at AAD, generate a secret and call teh rest API to retrieve the token required for oAuth authentication of a wep app or logic app.
This token can be used further in the app to authenticate the request.

For more details on performing these actions in UI- https://techcommunity.microsoft.com/t5/integrations-on-azure/secure-logic-app-http-endpoint-with-azure-ad-integration/ba-p/1450690


