package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class MemberDAO {
	private MemberDAO() throws Exception{
		// 1. 드라이버 로딩 -> ojbc6.jar > zip 같음
   
        Class.forName("oracle.jdbc.driver.OracleDriver");
         System.out.println("드라이버로딩 성공");   
	}
	static MemberDAO memberDAO = null;
	public static MemberDAO getInstance() throws Exception{
		if(memberDAO == null) {
			memberDAO = new MemberDAO();
		}
		return memberDAO;
	}
   public void insert(MemberVO vo) throws Exception {
	   PreparedStatement stmt = null;
	   Connection con = null;
         try {
         
        	String name = vo.getName();
        	String ename = vo.getEname();
        	String email= vo.getEmail();
        	int age = vo.getAge();
        	  
         
      // 2. 연결객체 얻어오기
        String url="jdbc:oracle:thin:@192.168.0.56:1521:xe";
         String user="scott";
         String pass="tiger";

         con = DriverManager.getConnection(url,user,pass);
         System.out.println("DB 연결 성공");
         

      // 3. sql 문장 만들기
         String sql = "Insert into Bad(name, ename, email, age)  "
                   + " values( ?,?,?,?) ";
         
            
       // 4. 전송 객체 얻어오기
         
          stmt = con.prepareStatement(sql);
          stmt.setString(1,name);
          stmt.setString(2,ename);
          stmt.setString(3,email);
          stmt.setInt(4,age);
         
         
       // 5. 전송
            /*    - ResultSet exeucuteQuery() : SELECT 
             *    - Int executeUpdate() : INSERT/DELETE/UPDATE
             */
        
          int result = stmt.executeUpdate();
          System.out.println(result + " 행 실행");
          
   
            
         }finally {
        		
 			// 6. 닫기
 			stmt.close();
 			con.close();
         }
   }
}