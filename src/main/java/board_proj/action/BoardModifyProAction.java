package board_proj.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_proj.dto.ActionForward;
import board_proj.dto.BoardDTO;
import board_proj.service.BoardDeleteService;
import board_proj.service.BoardModifyProService;
import board_proj.service.BoardModifyService;

public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int board_num = Integer.parseInt(request.getParameter("BOARD_NUM"));
		String pass = request.getParameter("BOARD_PASS");
		int page = Integer.parseInt(request.getParameter("page"));
		
		ActionForward forward = null;
		
		BoardModifyProService service = new BoardModifyProService();
		boolean isArticleWriter = service.isArticleWriter(board_num, pass);

		if(!isArticleWriter) {
			sendMessage(response, "수정할 권한이 없습니다.");
			return forward;
		} 
		
		BoardDTO article = new BoardDTO();
		article.setBoard_num(board_num);
		String subject = request.getParameter("BOARD_SUBJECT");
		article.setBoard_subject(subject);
		String content = request.getParameter("BOARD_CONTENT");
		// 줄바꿈 변환
		String contentSubs = content.replace("\r\n", "<br>");
		article.setBoard_content(contentSubs);
		
		boolean isModifySuccess = service.modifyArticle(article);
		
		if (!isModifySuccess) {
			sendMessage(response, "수정실패");
			return forward;
		} 
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("boardDetail.do?board_num=" + board_num + "&page=" + page);
		
		return forward;
	}

	private void sendMessage(HttpServletResponse response, String msg) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('" + msg + "');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
	}

}
