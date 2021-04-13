package board_proj.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board_proj.action.Action;
import board_proj.action.BoardWriteProAction;
import board_proj.dto.ActionForward;

@WebServlet("*.do")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String requestURI = request.getRequestURI();
//		String contextPath = request.getContextPath();
		String command = request.getServletPath();
		
//		String command = requestURI.substring(contextPath.length());
//		System.out.println(requestURI + " >> " + contextPath + " >> " + command);
		System.out.println(command);
		
		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/boardWriteForm.do")) {
//			request.getRequestDispatcher(forward.getPath()).forward(request, response);
			forward = new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");
		} else if(command.equals("/boardWritePro.do")) {
			action = new BoardWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/boardList.do")) {
			System.out.println("boardList.do >> ");
		}
		
		if (forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				request.getRequestDispatcher(forward.getPath()).forward(request, response);
			}
		}
	}

}
