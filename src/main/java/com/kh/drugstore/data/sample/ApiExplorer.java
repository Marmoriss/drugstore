package com.kh.drugstore.data.sample;
/* Java 1.8 샘플 코드 */


import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class ApiExplorer {
    public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/HtfsInfoService2/getHtfsList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=guVozzj6L6NkisOO0rbzbNW452DgE9%2BlwN2QEWSeXtPyVmOY7ZVd9DHA6hVwbHyIV6jPP79NaXo%2BY36RkyNIsQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("Entrps","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*업체명*/
        urlBuilder.append("&" + URLEncoder.encode("Prduct","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제품명*/
        urlBuilder.append("&" + URLEncoder.encode("Sttemnt_no","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*품목제조관리번호*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*응답데이터 형식(xml/json) Default: xml*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
    }
}