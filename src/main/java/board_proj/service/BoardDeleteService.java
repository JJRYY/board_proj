package board_proj.service;

import java.sql.Connection;

import board_proj.dao.impl.BoardDaoImpl;
import board_proj.ds.JndiDS;
import board_proj.dto.BoardDTO;

public class BoardDeleteService {
	private BoardDaoImpl dao = BoardDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();

	public BoardDeleteService() {
		dao.setCon(con);
	}

	public boolean isArticleWriter(int board_num, String pass) {
		return dao.isArticleBoardWriter(board_num, pass);
	}
	
	public boolean removeArticle(int board_num) {
		BoardDTO delBoard = new BoardDTO(board_num);
		return dao.deleteArticle(delBoard) == 1 ? true : false;
	}
	
}
