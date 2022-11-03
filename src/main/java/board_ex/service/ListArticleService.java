package board_ex.service;

import java.util.List;

import board_ex.model.*;
import guest.model.MessageDao;
import guest.model.MessageException;

public class ListArticleService {
	 private int totalRecCount;      // 전체 레코드 수   
	 private int pageTotalCount;      // 전체 페이지 수
	 private int countPerPage = 5;   // 한페이지당 레코드 수
	   
	
	
	private static ListArticleService instance;
	
	public static ListArticleService getInstance()  throws BoardException
	{
		if( instance == null )
		{
			instance = new ListArticleService();
		}
		return instance;
	}
	
	private  ListArticleService(){}
	
	public List <BoardVO> getArticleList(String pNum) throws BoardException
	{
		// 전체 레코드를 검색해 온다면
		   int pageNum = 1;
		   if(pNum != null) pageNum = Integer.parseInt(pNum);
		   /* 	
	  		페이지 번호		/ 시작레코드 번호 		/ 끝 레코드 번호
	  			1					1					3
	  			2					4					6
	  			3					7					9
		    */
	      int startRow		=	countPerPage*pageNum-(countPerPage-1);
	      int endRow		=	pageNum*countPerPage;   
	   
		 List <BoardVO> mList = BoardDao.getInstance().selectList(startRow,endRow);			
		return mList;
	}
	
	public int getTotalPage() throws BoardException{
	      //전체 레코드수
	      totalRecCount =BoardDao.getInstance().getTotalCount(); 
	      /*
	       * 전체 레코드 수       페이지 수
	       *       9            3
	       *       10            4
	       *       11            4
	       *       13            5
	       * 
	       * totalRecCount  /  pageTotalCount 
	       */
	      pageTotalCount=totalRecCount/countPerPage;
	      if((totalRecCount%countPerPage)>0) {pageTotalCount++;}
	      
	      //전체 레코드수에 따른 페이지수 리턴
	      return pageTotalCount;
	   }
		
}
