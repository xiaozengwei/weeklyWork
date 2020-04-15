package com.gx.soft.common.util;


import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;


public class HttpClient {
    /************************�����ǽ��https˽Կ���Ϸ������� ����****************************/

    public static String sendHttpRequest(String url,String parameter,String contentType){
        CloseableHttpClient client = HttpClients.createDefault();
        String respContent=null;
        HttpPost httpPost=new HttpPost(url);
        httpPost.setHeader("Content-Type",contentType);
        StringEntity entity=new StringEntity(parameter,"UTF-8");
        entity.setContentEncoding("UTF-8");
        entity.setContentType("application/json");
        httpPost.setEntity(entity);
        try{
            CloseableHttpResponse response=client.execute(httpPost);
            if(response.getStatusLine().getStatusCode()==200){
                HttpEntity he=response.getEntity();
                respContent= EntityUtils.toString(he,"UTF-8");
            }


        }catch (Exception ex){
            ex.printStackTrace();
        }

        return respContent;
    }
    /**
     * 模拟发送url Get 请求
     * @param url
     * @return
     */
    public static String requestByGetMethod(String url) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        StringBuilder entityStringBuilder = null;
        try {
            HttpGet get = new HttpGet(url);
            CloseableHttpResponse httpResponse = null;
            httpResponse = httpClient.execute(get);
            try {
                HttpEntity entity = httpResponse.getEntity();
                entityStringBuilder = new StringBuilder();
                if (null != entity) {
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"), 8 * 1024);
                    String line = null;
                    while ((line = bufferedReader.readLine()) != null) {
                        entityStringBuilder.append(line + "/n");
                    }
                }
            } finally {
                httpResponse.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (httpClient != null) {
                    httpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return entityStringBuilder.toString();
    }

    public static String sendHttpRequestPost(String url, List<NameValuePair> pairs, String contentType)throws Exception {
        CloseableHttpClient client = HttpClients.createDefault();
        String respContent = null;
        HttpPost httpPost = new HttpPost(url);
        httpPost.setHeader("Content-Type", contentType);

//        StringEntity entity = new StringEntity(parameter,ContentType.APPLICATION_FORM_URLENCODED);
//        entity.setContentEncoding("UTF-8");
//        entity.setContentType("application/x-www.form-urlencoded");
//        httpPost.setEntity(entity);

//        List<NameValuePair> pairs = new ArrayList<NameValuePair>();
//        NameValuePair pair3 = new BasicNameValuePair("deviceIds","{\"devices\":[{\"deviceId\":57,\"money\":1,\"secret\":\"19c285fae3d617df92522368f0473430\"}],\"ipAddress\":\"192.168.50.23\",\"actionType\":0}");
//        pairs.add(pair3);
        httpPost.setEntity(new UrlEncodedFormEntity(pairs, HTTP.UTF_8));

        try {
            CloseableHttpResponse response = client.execute(httpPost);
            if (response.getStatusLine().getStatusCode() == 200) {
                HttpEntity he = response.getEntity();
                respContent = EntityUtils.toString(he, "UTF-8");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return respContent;
    }

    public static String sendHttpRequestPost(String url, String parameter,String method, String contentType) {
        OutputStreamWriter out = null;
        InputStream is = null;
        String result="";
        try {
            URL url1 = new URL(url);// 创建连接
            HttpURLConnection connection = (HttpURLConnection) url1.openConnection();
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setUseCaches(false);
            connection.setInstanceFollowRedirects(true);
            connection.setRequestMethod(method); // 设置请求方式
            connection.setRequestProperty("Accept",contentType); // 设置接收数据的格式
            connection.setRequestProperty("Content-Type", contentType); // 设置发送数据的格式
            connection.connect();
            out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8"); // utf-8编码
            out.append(parameter);
            out.flush();
            out.close();

            // 读取响应
            is = connection.getInputStream();
            int length = (int) connection.getContentLength();// 获取长度
            if (length != -1) {
                byte[] data = new byte[length];
                byte[] temp = new byte[512];
                int readLen = 0;
                int destPos = 0;
                while ((readLen = is.read(temp)) > 0) {
                    System.arraycopy(temp, 0, data, destPos, readLen);
                    destPos += readLen;
                }
                result = new String(data, "UTF-8"); // utf-8编码
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}