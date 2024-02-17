package com.fileupload;

import com.common.DBCoonPool;

import java.util.ArrayList;
import java.util.List;

public class MyFileDAO extends DBCoonPool {
    // 게시글 작성
    public int insertFile(MyFileDTO dto) {
        int applyResult = 0;
        try{
            String query = "INSERT INTO scott.myfile ("
                    + " idx, title, cate, ofile, sfile) "
                    + " VALUES ( "
                    + " scott.seq_board_num.nextval, ?, ?, ?, ?)";

            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getCate());
            psmt.setString(3, dto.getOfile());
            psmt.setString(4, dto.getSfile());

            applyResult = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("Insert 중 예외 발생");
            e.printStackTrace();
        }
        return applyResult;
    }
    public List<MyFileDTO> myFileList() {
        List<MyFileDTO> fileList = new ArrayList<>(); {
            String query = "SELECT * FROM scott.myfile ORDER BY idx DESC";
            try {
                stmt = con.createStatement();
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    MyFileDTO dto = new MyFileDTO();
                    dto.setIdx(rs.getString("idx"));
                    dto.setTitle(rs.getString("title"));
                    dto.setCate(rs.getString("cate"));
                    dto.setSfile(rs.getString("sfile"));
                    dto.setOfile(rs.getString("ofile"));
                    dto.setPostdate(rs.getString("postdate"));

                    fileList.add(dto);
                }
            }
            catch (Exception e) {
                e.printStackTrace();
                System.out.println("myFileList 오류 발생");
            }
        }
        return fileList;
    }
}

