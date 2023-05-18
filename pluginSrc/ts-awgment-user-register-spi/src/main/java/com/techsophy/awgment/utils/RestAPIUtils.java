package com.techsophy.awgment.provider.utils;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;
import javax.xml.xpath.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.techsophy.awgment.dto.UserRequestPayload;
import com.techsophy.awgment.utils.Rsa4096;
import org.apache.http.*;
import org.apache.http.client.*;
import org.apache.http.client.methods.*;
import org.apache.http.client.utils.*;
import org.apache.http.entity.*;
import org.apache.http.impl.client.*;
import org.apache.http.util.*;
import org.xml.sax.*;

public class RestAPIUtils {
    public static void addUserToAwgment(String eventType,
                                        String userName,
                                         String userId,
                                         String realm,
                                         String clientId,
                                         String identityProvider) throws Exception {
        try (CloseableHttpClient httpclient = HttpClients.createDefault()) {

            HttpPost httpPost = new HttpPost("http://localhost:8082/user/"+eventType+"/"+realm+"/"+clientId+"/"+identityProvider);

            UserRequestPayload post = UserRequestPayload.builder()
                    .department("dept")
                    .lastName("lastName")
                    .emailId(userName)
                    .firstName(userName)
                    .mobileNumber("mobileNo")
                    .userName(userName)
                    .build();
            ObjectWriter ow = new ObjectMapper().writer();
            String strJson = ow.writeValueAsString(post);
            Rsa4096 rsa4096 = new Rsa4096();
            httpPost.setHeader("Signature", rsa4096.encryptToBase64("Keycloak-to-Awgment"));
            StringEntity strEntity = new StringEntity(strJson, ContentType.APPLICATION_JSON);
            httpPost.setEntity(strEntity);
            httpPost.setHeader("Content-type", "application/json");

            try (CloseableHttpResponse response = httpclient.execute(httpPost)) {
                Integer statusCode = response.getStatusLine().getStatusCode();
            } catch (ParseException e) {
                e.printStackTrace();
            }

        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
//        try {
//
//            String stubsApiBaseUri = "http://localhost:8082/user";
//
//            HttpClient client = HttpClients.createDefault();
//
//            URIBuilder builder = new URIBuilder(stubsApiBaseUri);
//            builder.addParameter("eventType", eventType);
//            builder.addParameter("userName", userName);
//            builder.addParameter("userId", userId);
//            builder.addParameter("realm", realm);
//            builder.addParameter("identityProvider", identityProvider);
//            builder.addParameter("clientId", clientId);
//            String listStubsUri = builder.build().toString();
//            HttpGet getStubMethod = new HttpGet(listStubsUri);
//            HttpResponse getStubResponse = client.execute(getStubMethod);
//            int getStubStatusCode = getStubResponse.getStatusLine()
//                    .getStatusCode();
//            if (getStubStatusCode < 200 || getStubStatusCode >= 300) {
//                // Handle non-2xx status code
//                return;
//            }
//            String responseBody = EntityUtils
//                    .toString(getStubResponse.getEntity());
//            // Assuming only one stub matches
//            String stubRelativeUri = XPathFactory
//                    .newInstance()
//                    .newXPath()
//                    .evaluate("/stubs/stub/@href",
//                            new InputSource(new StringReader(responseBody)));
//            String stubAbsoluteUri = new URI(stubsApiBaseUri).resolve(
//                    stubRelativeUri).toString();
//
//            HttpPost startStubMethod = new HttpPost(stubAbsoluteUri);
//            ContentType contentType = ContentType.APPLICATION_XML
//                    .withCharset("utf-8");
//            String data = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
//                    + "<start-stub />";
//            startStubMethod.setEntity(new ByteArrayEntity(data
//                    .getBytes(contentType.getCharset()), contentType));
//            HttpResponse startStubResponse = client.execute(startStubMethod);
//            int startStubStatusCode = startStubResponse.getStatusLine()
//                    .getStatusCode();
//            if (startStubStatusCode < 200 || startStubStatusCode >= 300) {
//                // Handle non-2xx status code
//                return;
//            }
//            // If you want to check the status of the stub that is starting, you
//            // can use the response data to get the stub instance URI and poll it
//            // for updates
//            System.out.println(startStubStatusCode);
//            String startStubResponseBody = EntityUtils.toString(startStubResponse
//                    .getEntity());
//            System.out.println(startStubResponseBody);
//
//        } catch (URISyntaxException | IOException | XPathExpressionException e) {
//            // Handle errors
//        }
    }

}
