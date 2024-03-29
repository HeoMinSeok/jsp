package com.fileupload;

import com.util.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

public class FileUtil {
    public static String uploadFile(HttpServletRequest req, String sDirectory) throws ServletException, IOException {
        Part part = req.getPart("ofile");
        String partHeader = part.getHeader("content-disposition");
        System.out.println("partHeader ::: " + partHeader);

        // 헤더 값에서 파일명 잘라내기
        String[] phArr = partHeader.split("filename=");
        String originalFileName = phArr[1].trim().replace("\"", "");
        System.out.println("ori file Name :: " + originalFileName);
        if (!originalFileName.isEmpty())
            part.write(sDirectory + File.separator + originalFileName);

        return originalFileName;
    }
    public static String renameFile(String sDirectory, String fileName) {
        String ext = fileName.substring(fileName.lastIndexOf("."));
        String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
        String newFileName = now + ext;
        File oldFile = new File(sDirectory + File.separator + fileName);
        File newFile = new File(sDirectory + File.separator + newFileName);
        oldFile.renameTo(newFile);

        return newFileName;
    }
    public static ArrayList<String> multipleFile(HttpServletRequest req, String sDir) throws ServletException, IOException {
        ArrayList<String> listFileName = new ArrayList<>();
        Collection<Part> parts = req.getParts();
        for(Part part : parts) {
            if(!part.getName().equals("ofile"))
                continue;
            String partHeader = part.getHeader("content-disposition");
            String[] phArr = partHeader.split("filename=");
            String originalFileName = phArr[1].trim().replace("\"", "");
            if(!originalFileName.isEmpty())
                part.write(sDir+ File.separator +originalFileName);
            listFileName.add(originalFileName);
        }
        return listFileName;
    }
    public static void download(HttpServletRequest req, HttpServletResponse resp, String dir, String sfileName, String ofileName) {
        String sDir = req.getServletContext().getRealPath(dir);

        try {
            File file = new File(sDir, sfileName);
            InputStream inStream = new FileInputStream(file);

            String client = req.getHeader("User-Agent");
            if(!client.contains("WOW64")){
                ofileName = new String(ofileName.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
                System.out.println("클라이언트 헤더 정보 : " + client);
            }
            else {
                ofileName = new String(ofileName.getBytes("KSC5601"), StandardCharsets.ISO_8859_1);
            }

            resp.reset();
            resp.setContentType("application/octet-stream; charset=utf-8");
            resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
            resp.setHeader("Content-Length", "" + file.length());

            OutputStream outStream = resp.getOutputStream();

            byte[] b = new byte[(int)file.length()];
            int readBuffer = 0;
            while ((readBuffer = inStream.read(b)) > 0)
                outStream.write(b, 0, readBuffer);

            inStream.close();
            outStream.close();
        }
        catch (FileNotFoundException e) {
            System.out.println("파일을 찾을 수 없습니다.");
            e.printStackTrace();
        }
        catch (Exception e) {
            System.out.println("예외가 발생하였습니다.");
            e.printStackTrace();
        }
    }
    public static void deleteFile(HttpServletRequest req, String dir, String filename) {
        String sDir = req.getServletContext().getRealPath(dir);
        File file = new File(sDir + File.separator + filename);
        if(file.exists())
            file.delete();
    }
}
