package Controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;

public class ConvertDateWithString {
	SimpleDateFormat format;
	
	public Date ConvertStringToDate(String inputDate) throws ParseException{
		format = new SimpleDateFormat("yyyyMMdd");
		Date parsed = (Date) format.parse(inputDate);
		java.sql.Date sql = new java.sql.Date(parsed.getTime());
		return sql;
	}
	
	public String ConvertDateToString(Date inputDate){
		String dateStr = null;
		String.format(dateStr, inputDate);
		return dateStr;
	}
}
