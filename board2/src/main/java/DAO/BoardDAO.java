package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.Board;

public class BoardDAO {
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    
    //DB연결 메소드
    public Connection open() {
    	Connection conn = null;
    	try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "test", "test1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	return conn; //DB연결 객체를 리턴
    }
    
    //게시판 리스트 가져오기
    public ArrayList<Board> getList() throws Exception {
    	Connection conn = open();
    	ArrayList<Board> boardList = new ArrayList<>(); //Board 객체를 지정할 ArrayList
    	
    	String sql = "SELECT BOARD_NO, TITLE, USER_ID, "
    			+ "TO_CHAR(REG_DATE, 'YYYY.MM.DD') REG_DATE, "
    			+ "VIEWS FROM BOARD";
    	
    	PreparedStatement pstmt = conn.prepareStatement(sql); //쿼리문 등록 -> 컴파일
    	ResultSet rs = pstmt.executeQuery(); //쿼리문 실행 -> DB 결과 저장
    	
    	//리소스 자동 닫기(try-with-resource)
    	/**
    	* try() {		
    	* } catch(Exception e) {		
    	* } finally {
    	*	conn.close();
    	*	pstmt.close();
    	*	rs.close();
		* }
		
		* try(conn; pstmt; rs)
		* -> 알아서 닫아줌!
    	 */
    	
    	try(conn; pstmt; rs) {
    		while(rs.next()) {
    			Board b = new Board();
    			b.setBoard_no(rs.getInt(1));
    			b.setTitle(rs.getString(2));
    			b.setUser_id(rs.getString(3));
    			b.setReg_date(rs.getString(4));
    			b.setViews(rs.getInt(5));
    			
    			boardList.add(b);
    			
    		}
    		return boardList;
	    } 
    	
    }
    
    //게시판 내용 가져오기
    public Board getView(int board_no) throws Exception {
    	Connection conn = open();
    	Board b = new Board();
    	
    	String sql = "SELECT BOARD_NO, TITLE, USER_ID, "
    			+ "TO_CHAR(REG_DATE, 'YYYY.MM.DD') REG_DATE, "
    			+ "VIEWS, CONTENT "
    			+ "FROM BOARD WHERE BOARD_NO = ?";
    	
    	PreparedStatement pstmt = conn.prepareStatement(sql); //쿼리문 등록 -> 컴파일
    	pstmt.setInt(1, board_no); //쿼리문 ?에 들어갈 값
    	ResultSet rs = pstmt.executeQuery(); //쿼리문 실행 -> DB 결과 저장
    	
    	try(conn; pstmt; rs) {
    		
    		while(rs.next()) {
    			b.setBoard_no(rs.getInt(1));
    			b.setTitle(rs.getString(2));
    			b.setUser_id(rs.getString(3));
    			b.setReg_date(rs.getString(4));
    			b.setViews(rs.getInt(5));
    			b.setContent(rs.getString(6));
    			
    		}	
	    }   
    	return b;
    }
    
    //조회수 증가
    public void updateViews(int board_no) throws Exception {
    	Connection conn = open();
    	
    	String sql = "UPDATE BOARD SET VIEWS = (VIEWS + 1) "
    			+ "WHERE BOARD_NO = ?";
    	
    	PreparedStatement pstmt = conn.prepareStatement(sql); //쿼리문 등록 -> 컴파일
    	
    	try(conn; pstmt) {
    		pstmt.setInt(1, board_no);
    		pstmt.executeUpdate();
    	} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
  //게시판 글 등록
  	public void insertBoard(Board b) throws Exception {
  		Connection conn = open();
  		
  		String sql = "INSERT INTO BOARD (BOARD_NO, USER_ID, TITLE, CONTENT, REG_DATE, VIEWS) "
  				+ "	VALUES(BOARD_SEQ.nextval, ?, ?, ?, SYSDATE, 0)";
  		
  		PreparedStatement pstmt = conn.prepareStatement(sql);
  		
  		try(conn; pstmt) {
  			pstmt.setString(1, b.getUser_id());
  			pstmt.setString(2, b.getTitle());
  			pstmt.setString(3, b.getContent());
  			pstmt.executeUpdate();
  		}
  	}
    
}