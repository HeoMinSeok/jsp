package com.model2;

import com.common.DBCoonPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends DBCoonPool {
    public MVCBoardDAO() {
        super();
    }

    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM scott.mvcboard";
        if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MVCBoard selectCount 오류 발생");
        }

        return totalCount;
    }
    public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
        List<MVCBoardDTO> board = new ArrayList<MVCBoardDTO>();

        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.mvcboard";
        if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY idx desc"
                + " ) Tb"
                + " )"
                + " WHERE rNUM BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while(rs.next()) {
                MVCBoardDTO dto = new MVCBoardDTO();

                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));

                board.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return board;
    }
    public int insertWrite(MVCBoardDTO dto) {
        int result = 0;

        try {
            String query = "INSERT INTO scott.mvcboard ( "
                    + " idx, name, title, content, ofile, sfile, pass)"
                    +" VALUES ("
                    +" scott.seq_board_num.nextval, ?,?,?,?,?,?)";

            psmt = con.prepareStatement(query);

            psmt.setString(1, dto.getName());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getPass());

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("게시물 입력 중 예외 발생");
        }
        return result;
    }
    public MVCBoardDTO selectView(String idx) {
        MVCBoardDTO dto = new MVCBoardDTO();
        String query = "SELECT * FROM scott.mvcboard WHERE idx=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            rs = psmt.executeQuery();

            if(rs.next()) {
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));

            }
        } catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        return dto;
    }
    public void updateVisitCount(String idx) {
        String query = "UPDATE scott.mvcboard"
                + " SET visitcount = visitcount + 1"
                + " WHERE idx = ? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            psmt.executeQuery();
        } catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }
    public void downCountPlus(String idx) {
        String sql = "UPDATE scott.mvcboard SET "
                + " downcount = downcount + 1 "
                + " WHERE idx=? ";
        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, idx);
            psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("다운로드 횟수 증가 오류");;
        }
    }
    public boolean confirmPassword(String pass, String idx) {
        boolean isCorr = true;
        try {
            String sql = "SELECT COUNT(*) FROM scott.mvcboard WHERE + pass=? AND idx=?";
            psmt = con.prepareStatement(sql);
            psmt.setString(1, pass);
            psmt.setString(2, idx);
            rs = psmt.executeQuery();
            rs.next();
            if(rs.getInt(1) == 0)
                isCorr = false;

        } catch (Exception e) {
            isCorr = false;
            e.printStackTrace();
        }
        return isCorr;
    }
    public int deletePost(String idx) {
        int result = 0;
        try{
            String query = "DELETE FROM scott.mvcboard WHERE idx=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
    public int updatePost(MVCBoardDTO dto) {
        int result = 0;
        try{
            String query = "UPDATE SCOTT.MVCBOARD"
                    + " SET title=?, name=?, content=?, ofile=?, sfile=? "
                    + " WHERE idx=? and pass=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getName());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getOfile());
            psmt.setString(5, dto.getSfile());
            psmt.setString(6, dto.getIdx());
            psmt.setString(7, dto.getPass());

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("게시물 수정 중 예외 발");
        }
        return result;
    }
}

