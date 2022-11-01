package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

   
   // DB 연결시  관한 변수
   //값을 변경하거나 다른 곳에서 접근하지 못하게 하도록 private static final을 붙혀 선언

   private static final String    dbDriver   =   "oracle.jdbc.driver.OracleDriver";
   private static final String      dbUrl      =   "jdbc:oracle:thin:@192.168.0.56:1521:xe";
   private static final String      dbUser      =   "scott";
   private static final String      dbPass      =   "tiger";

   //   MemberDao 변수 선언
   private static MemberDao memberDao;
   
   //싱글톤 객체 생성 해주기
   public static MemberDao getInstance() throws MemberException
   {
      if( memberDao == null )
      {
         memberDao =  new MemberDao();
      }
      return memberDao;
   }
   
   //기본 생성자 함수 안에 드라이버 로딩해주기
   private MemberDao() throws MemberException
   {
         
      try{
         //1. driver loading (보낼 때마다가 아닌 드라이버 로딩 1번만 할거임)
         Class.forName(dbDriver);
         System.out.println("드라이버로딩 성공");   
      
      }catch( Exception ex ){
         throw new MemberException("DB 연결시 오류  : " + ex.toString() );   
      }
   }
   
   /*******************************************
    * * 회원관리테이블 MEMBERTEST 에  회원정보를 입력하는 함수
    * @param rec
    * @throws MemberException
    */
   //insert 메소드 설정해서 db와 연결해주기
   public void insertMember( Member rec ) throws MemberException
   {
      try {
         // 0. 연결 객체 얻어오기
         //전송 객체 선언 해주기
         Connection con=null;                                 
         PreparedStatement ps=null;
         
         con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
         System.out.println("DB 연결 성공"); 
         
          // 1. sql 문장 만들기 ( insert문 )
         String sql = "INSERT INTO memberTest (id, password, name, tel, addr ) VALUES (?,?,?,?,?) ";
          
         // 2. sql 전송 객체 만들기
         ps=con.prepareStatement(sql);
         ps.setString(1,rec.getId());
         ps.setString(2,rec.getPassword());;
         ps.setString(3,rec.getName());;
         ps.setString(4,rec.getTel());
         ps.setString(5,rec.getAddr());
         
         // 3. sql 전송
         ps.executeUpdate();
         
         // 4. 객체 닫기
         ps.close();
         con.close();
         
      } catch ( Exception ex ){
         throw new MemberException("멤버 입력시 오류  : " + ex.toString() );
         
      }         
   }
   
   /**********************************************************
    * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
    */
   public boolean isDuplicatedId( String id ) throws MemberException
   {
      boolean flag = false;
      
      try{
         // 0. 연결 객체 얻어오기

         Connection con=null;                                 //전송 객체 선언 해주기
         ResultSet rs=null;
         PreparedStatement ps=null;


         con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
         System.out.println("DB 연결 성공");          
         
         // 1. sql 문장 만들기 ( insert문 )
         String sql="SELECT * FROM membertest WHERE id=?";
         
         // 2. sql 전송 객체 만들기
         ps = con.prepareStatement(sql);
           ps.setString(1, id);
           rs = ps.executeQuery();
         
         // 3. sql 전송
         if(rs.next()) {flag = true;}
         //rs의 값이 존재할 때(id 가 일치한다면 값들이 존재하니까 true로 반환하기)
         
         // 4. 객체 닫기
         rs.close();
         ps.close();
         con.close();
         
      }catch( Exception ex ){
         throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );         
      }
         
      return flag;
   }
   
   /**********************************************************
    * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
    */
   public boolean checkLogin(String id, String pass) throws Exception{
      boolean result=false;
      
      try{
         // 0. 연결 객체 얻어오기

         Connection con=null;                                 //전송 객체 선언 해주기
         ResultSet rs=null;
         PreparedStatement ps=null;


         con = DriverManager.getConnection(dbUrl,dbUser,dbPass);
         System.out.println("DB 연결 성공");          
         
         // 1. sql 문장 만들기 ( insert문 )
         String sql="SELECT * FROM membertest WHERE id=? AND password=?";
         
         // 2. sql 전송 객체 만들기
         ps = con.prepareStatement(sql);
           ps.setString(1, id);
           ps.setString(2, pass);
           rs = ps.executeQuery();
         
         // 3. sql 전송
         if(rs.next()) {result = true;}
         //rs의 값이 존재할 때(id 가 일치한다면 값들이 존재하니까 true로 반환하기)
         
         // 4. 객체 닫기
         rs.close();
         ps.close();
         con.close();
         
      }catch( Exception ex ){
         throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );         
      }
      
      return result;
   }
   
   
   
}