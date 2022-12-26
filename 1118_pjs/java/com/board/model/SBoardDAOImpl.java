package com.board.model;

import java.nio.channels.ClosedChannelException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConnection;

public class SBoardDAOImpl implements SBoardDAO{
	private static SBoardDAO instance = new SBoardDAOImpl();
	public static SBoardDAO getInstance() {
		return instance;
	}
	//추가하기
	@Override
	public void boardInsert(BoardDTO board) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement("insert into simpleboard "
					+ "(num, userid, subject, email, content, regdate) "
					+ "values(simpleboard_seq.nextval,?,?,?,?,sysdate)");
			ps.setString(1, board.getUserid());
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getEmail());
			ps.setString(4, board.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}
	//수정하기
	@Override
	public void boardUpdate(BoardDTO board) {
		// TODO Auto-generated method stub
		
	}
	//전체보기
	@Override
	public ArrayList<BoardDTO> boardList() {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> arr = new ArrayList<>();
		
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from simpleboard");
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setUserid(rs.getString("userid"));
				board.setSubject(rs.getString("subject"));
				board.setEmail(rs.getString("email"));
				board.setReadCount(rs.getInt("readcount"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getString("regdate"));
				arr.add(board);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return arr;
	}
	//
	@Override
	public ArrayList<BoardDTO> boaraList(int startRow, int endRow, String field, String word) {
		// TODO Auto-generated method stub
		return null;
	}
	//삭제
	@Override
	public void boardDelete(int num) {
		// TODO Auto-generated method stubs
		
	}
	//게시글 수 
	@Override
	public int boardCount(String field, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		int count = 0;
		String sql="";
		
		try {
			con = DBConnection.getConnection();
			if(word.equals("")) {//검색아님
				sql = "select count(*) from board";
			}else {//검색
				sql = "select count(*) from board where "+field+" like '%"+word+"%'";
			}
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return count;
	}
	//상세보기
	@Override
	public BoardDTO findByNum(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		BoardDTO board = null;
		
		try {
			con = DBConnection.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select * from simpleboard where num="+num);
			if(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setUserid(rs.getString("userid"));
				board.setSubject(rs.getString("subject"));
				board.setReadCount(rs.getInt("readcount"));
				board.setEmail(rs.getString("email"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, null, st, rs);
		}
		return board;
	}
	//코멘트추가
	@Override
	public void commentInsert(CommentDTO comment) {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = DBConnection.getConnection();
			String sql = "insert into comboard values(comboard_seq.nextval,?,?,sysdate,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, comment.getMsg());
			ps.setString(2, comment.getUserid());
			ps.setInt(3, comment.getBnum());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection(con, ps, null, null);
		}
	}
	//코멘트 전체보기
	@Override
	public ArrayList<CommentDTO> findAllComment(int bnum) {
		// TODO Auto-generated method stub
		return null;
	}
	//코멘트 개수
	@Override
	public int commentCount(int bnum) {
		// TODO Auto-generated method stub
		return 0;
	}
	private void closeConnection(Connection con, PreparedStatement ps,
			Statement st, ResultSet rs) {
			try {
				if(con !=null) 			con.close();
				if(ps !=null) 				ps.close();
				if(st !=null) 				st.close();
				if(rs !=null) 				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
		}
		
	}
}
