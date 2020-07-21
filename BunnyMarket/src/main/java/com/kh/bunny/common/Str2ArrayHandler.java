package com.kh.bunny.common;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

// 문자열을 배열로, 배열을 문자열로 상호치환해주는 핸들러 
// 배열이 여러개면 이걸로 처리하는게 더 편하다. 한번 만들어놓으면 한번에 바꿔주니까. 
// 배열이 하나라면 자바에서 조인으로 처리하는게 더 낫다. 
public class Str2ArrayHandler implements TypeHandler<String[]> {

	// Override해야할 메소드들이 나온다 --> 강제성! 
	// 구현해야할 메소드가 확실히 정해짐. 
	
	/**
	 * 문자열과 배열을 상호 호환하기 위한 타입(자료형) 변환기 
	 * 
	 *  3개의 getter 메소드와 1개의 setter메소드를 구현해야 한다. <br>
	 *  
	 *  <h3> - getter - </h3>
	 *  <p> 1. 결과셋(ResultSet)에서 컬럼 이름으로 변환하는 방법 </p>
	 *  <p> 2. 결과셋에서 컬럼의 순번으로 찾아 변환하는 방법</p>
	 *  <p> 3. 프로시져 호출용 getter 구현 용도 </p>
	 * 
	 *  <h3> setter </h3>
	 *  <p> 1. setter : String[] => String (join 메소드 역할) </p>
	 *  
	 * 
	 */
	@Override
	public void setParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType) throws SQLException {
		if(parameter != null) {
 			ps.setString(i, String.join(", ", parameter)); // i번째에 있는 애를 , 단위로 바꿔주세요~
		} else {
			// null이 들어온 경우.. 그냥 빈칸을 주세요. 
			ps.setString(i,  ""); // setString은 영어 1바이트, 한글 2바이트, setNstring은 영어 한글 상관없이 무조건 2바이트 
		}
		
	}

	@Override
	public String[] getResult(ResultSet rs, String columnName) throws SQLException {
		String colVal = rs.getString(columnName); // 문자열을 가져온다. 
		//"Java, C, C++" 
		
		// 이제 그 문자열을 쪼개준다. 
		String[] result = colVal.split(","); // 0 : "Java", 1 : "C", 2 : "C++"
		
		return result;
	}

	// getString()안의 패러미터를 숫자로도 접근이 가능하고 문자열로도 접근이 가능하다.
	// 컬럼이름으로도 접근이 가능하고 몇번째 컬럼인지 인덱스 번호로도 접근이 가능하다. 
	
	@Override
	public String[] getResult(ResultSet rs, int columnIndex) throws SQLException {
		String colVal = rs.getString(columnIndex); // 문자열을 가져온다. 
		//"Java, C, C++" 
		
		// 이제 그 문자열을 쪼개준다. 
		String[] result = colVal.split(","); // 0 : "Java", 1 : "C", 2 : "C++"
		
		return result;
	}

	@Override
	public String[] getResult(CallableStatement cs, int columnIndex) throws SQLException {
		// Callable로 들어왔다면..? 
		// 그래도 결국엔 getString으로 해당하는 번호.. 몇번째 컬럼 가져와서 뜯어낼거냐~ 
		
		
		String colVal = cs.getString(columnIndex); // 문자열을 가져온다. 
		//"Java, C, C++" 
		
		// 이제 그 문자열을 쪼개준다. 
		String[] result = colVal.split(","); // 0 : "Java", 1 : "C", 2 : "C++"
		
		return result;
	}
}
