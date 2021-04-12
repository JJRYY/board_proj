package board_proj.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board_proj.dao.BoardDao;
import board_proj.dto.BoardDTO;

public class BoardDaoImpl implements BoardDao {
	private static final BoardDaoImpl instance = new BoardDaoImpl();
	private Connection con;
	
	
	public BoardDaoImpl() {
	}

	public static BoardDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardDTO> selectArticleList(int page, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDTO selectArticle(int board_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertArticle(BoardDTO article) {
		String sql = "INSERT INTO board" 
				+ " (BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE) VALUES" 
				+ " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, nextBoardNum());
			pstmt.setString(2, article.getBoard_name());
			pstmt.setString(3, article.getBoard_pass());
			pstmt.setString(4, article.getBoard_subject());
			pstmt.setString(5, article.getBoard_content());
			pstmt.setString(6, article.getBoard_file());
			pstmt.setInt(7, article.getBoard_re_ref());
			pstmt.setInt(8, article.getBoard_re_lev());
			pstmt.setInt(9, article.getBoard_re_seq());
			pstmt.setInt(10, article.getBoard_readcount());
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int insertReplyArticle(BoardDTO article) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateArticle(BoardDTO article) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArticle(BoardDTO article) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReadCount(int board_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean isArticleBoardWriter(int board_num, String pass) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int nextBoardNum() {
		String sql = "select max(BOARD_NUM) from board";
		try(PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if(rs.next()) {
				return rs.getInt(1)+1; // 첫번째 컬럼의 값 리턴
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 1;
	}

}
