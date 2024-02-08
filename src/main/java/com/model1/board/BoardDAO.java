package com.model1.board;

import com.common.DBCoonPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDAO extends DBCoonPool {
    public BoardDAO() {
        super();
    }

    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;

        String query = "SELECT COUNT(*) FROM scott.board_jsp";
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
            System.out.println("selectCount 오류 발생");
        }

        return totalCount;
    }
    public List<BoardDTO> selectList(Map<String,Object> map) {
        // 쿼리 결과를 담을 변수
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();

        // 쿼리문 작성
        String query = "SELECT * FROM scott.board_jsp";
        if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }

        query += " ORDER BY num desc";

        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);

            while(rs.next()) {
                // 한 row의 내용을 DTO에 저장
                BoardDTO dto = new BoardDTO();

                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getString("visitcount"));

                bbs.add(dto);
            }
        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("selectList 오류발생");
        }
        return bbs;
    }
    public int insertWrite(BoardDTO dto) {
        int result = 0;

        try {
            String query = "INSERT INTO scott.board_jsp ( "
                    + " num,title,content,id,visitcount)"
                    +" VALUES ("
                    +" scott.seq_board_num.nextval, ?,?,?,0)";

            psmt = con.prepareStatement(query);

            psmt.setString(1,dto.getTitle());
            psmt.setString(2,dto.getContent());
            psmt.setString(3,dto.getId());

            result = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("insertWrite 오류 발생");
        }
        return result;
    }
    public BoardDTO selectView(String num) {
        BoardDTO dto = new BoardDTO();
        try {
            String query = "SELECT B.*, M.name"
                    + " FROM scott.board_jsp B"
                    + " INNER JOIN scott.member_jsp M"
                    + " ON B.id=M.id "
                    + " WHERE num = ?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();

            if(rs.next()) {
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setVisitcount(rs.getString("visitcount"));
                dto.setPostdate(rs.getDate("postdate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("selectView 오류 발생");
        }
        return dto;
    }
    public void updateViewCount(String num) {
        String query = "UPDATE scott.board_jsp"
                + " SET visitcount = visitcount + 1"
                + " WHERE num =? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            psmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updateEdit(BoardDTO dto) {
        int result = 0;

        String query = "UPDATE scott.board_jsp"
                + " SET title = ?, content = ?"
                + " WHERE num = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getTitle());
            psmt.setString(2,dto.getContent());
            psmt.setString(3,dto.getNum());

            result = psmt.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
            System.out.println("updateEdit 오류 발생");
        }
        return result;
    }
    public int deletePost(BoardDTO dto) {
        int result = 0;

        try {
            String query = "DELETE FROM scott.board_jsp WHERE num=?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getNum());

            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new ArrayList<BoardDTO>();

        // 쿼리문 작성
        String query = "SELECT * FROM ("
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.board_jsp";
        if(map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }
        query += " ORDER BY num desc"
                + " ) Tb"
                + " )"
                + " WHERE rNUM BETWEEN ? AND ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            rs = psmt.executeQuery();

            while(rs.next()) {
                BoardDTO dto = new BoardDTO();

                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getString("visitcount"));

                bbs.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return bbs;
    }
}
