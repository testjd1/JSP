package mvc.guest.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mvc.guest.model.Message;
import mvc.guest.model.MessageDao;
import mvc.guest.model.MessageException;

public class CommandModify implements Command {
	 
			
	private String next;
	
	
	public CommandModify( String _next ){
		next = _next;
	}
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response  ) throws CommandException {
		try{

			
			Message msg = new Message();
			msg.setId( Integer.parseInt(request.getParameter("id")));
			msg.setMessage( request.getParameter("content"));
			msg.setPassword( request.getParameter("password"));
			
			
			int resultCnt = MessageDao.getInstance().update(msg);
			
			
				
		    request.setAttribute("result", resultCnt );
		    
		}catch( MessageException ex ){
			throw new CommandException("CommandModify.java < 수정시 > " + ex.toString() ); 
		}
		return next;
	}
	
}