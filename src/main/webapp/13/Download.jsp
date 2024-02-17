<%@ page import="com.util.JSFunction" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String saveDir = application.getRealPath("/Uploads");
  String saveFilename = request.getParameter("sName");
  String originalFilename = request.getParameter("oName");

  System.out.println("저장 경로 : " + saveDir);
  System.out.println("저장 파일 : " + saveFilename);
  System.out.println("원본 파일 : " + originalFilename);

  try {
    File file = new File(saveDir, saveFilename);
    InputStream inStream = new FileInputStream(file);

    String client = request.getHeader("User-Agent");
    if(client.indexOf("WOW64") == -1){
      originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
      System.out.println("클라이언트 헤더 정보 : " + client);
    }
    else {
      originalFilename = new String(originalFilename.getBytes("KSC5601"), "ISO-8859-1");
    }

    response.reset();
    response.setContentType("application/octet-stream; charset=utf-8");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
    response.setHeader("Content-Length", "" + file.length());

    out.clear();

    OutputStream outStream = response.getOutputStream();

    byte b[] = new byte[(int)file.length()];
    int readBuffer = 0;
    while ((readBuffer = inStream.read(b)) > 0)
      outStream.write(b, 0, readBuffer);

    inStream.close();
    outStream.close();
  }
  catch (FileNotFoundException fe) {
      JSFunction.alertBack("파일을 찾을 수 없습니다.",  out);
  }
  catch (Exception e) {
    JSFunction.alertBack("예외가 발생하였습니다.",  out);
  }
%>
