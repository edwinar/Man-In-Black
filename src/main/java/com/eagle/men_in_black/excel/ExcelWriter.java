package com.eagle.men_in_black.excel;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;


import org.apache.poi.ss.usermodel.CellStyle;

import com.eagle.men_in_black.model.CeoMypageDto;
import com.eagle.men_in_black.util.ExcelUtil;


public class ExcelWriter {
	private final String  PATH ="D:\\excel\\";
	//public void xlsWriter(List<Object> datas, List<Object> titles, List<Object> widths, String fileName ) 
	public int xlsWriter(List<CeoMypageDto> datas, String fileName )
	{
		int flag = 1;
		int startRow =5;
		int startCol =1;
		//workbook생성
		HSSFWorkbook workBook = new HSSFWorkbook();
		
		//work sheet생성
		if(fileName.equals(""))fileName="sheet1";
		HSSFSheet workSheet = workBook.createSheet(fileName);
		
		//행생성
		HSSFRow row = workSheet.createRow(startRow);
		
		//cell생성
		HSSFCell  cell;
		
		
		 * 	private String id;
	private String name;
	private String email;
	private String passwd;
		 
		
		//스타일 설정


		//스타일 객체 생성 
		HSSFCellStyle styleHd = workBook.createCellStyle();    //제목 스타일
		HSSFCellStyle styleBody = workBook.createCellStyle();   //내용 스타일


		//제목 폰트
		HSSFFont font = workBook.createFont();
		font.setFontHeightInPoints((short)12);
		font.setBoldweight((short)font.BOLDWEIGHT_BOLD);

		//제목 스타일에 폰트 적용, 정렬
		styleHd.setFont(font);
		styleHd.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		styleHd.setVerticalAlignment (HSSFCellStyle.VERTICAL_CENTER);
        styleHd.setFillBackgroundColor(HSSFColor.SKY_BLUE.index);
        styleHd.setFillForegroundColor(HSSFColor.SKY_BLUE.index);
        
        
		styleHd.setFillPattern(CellStyle.SOLID_FOREGROUND);
		
		cell = row.createCell(startCol);
		cell.setCellValue("아이디");		
		cell.setCellStyle(styleHd);
		
		cell = row.createCell(startCol+1);
		cell.setCellValue("이름");
		cell.setCellStyle(styleHd);
		
		cell = row.createCell(startCol+2);
		cell.setCellValue("이메일");
		cell.setCellStyle(styleHd);
		
		cell = row.createCell(startCol+3);
		cell.setCellValue("비번");		
		cell.setCellStyle(styleHd);
		



		
		for(int i=0;i<datas.size();i++)
		{
			CeoMypageDto vo = (CeoMypageDto)datas.get(i);
			row = workSheet.createRow(i+(startRow+1));
		     	
			cell = row.createCell(startCol+0);
			cell.setCellValue(vo.getITEM());
			
			cell = row.createCell(startCol+1);
			cell.setCellValue(vo.getPRO_NAME());
			
			cell = row.createCell(startCol+2);
			cell.setCellValue(vo.getUSER_ID());
			
			cell = row.createCell(startCol+3);
			cell.setCellValue(vo.getPRO_PRICE());
		}
		
		
		for (int i=0;i<4;i++) 
		{ 
			workSheet.autoSizeColumn(i);
			workSheet.setColumnWidth(i, (workSheet.getColumnWidth(i))+512 );
			//이건 자동으로 조절 하면 너무 딱딱해 보여서 자동조정한 사이즈에 (short)512를 추가해 주니 한결 보기 나아졌다.
		}
		workSheet.setColumnWidth(0, 200);
		
		
		File file=new File(PATH+fileName+"_"+ExcelUtil.getPK()+".xls" );
		FileOutputStream fo = null;
		try{
			fo = new FileOutputStream(file);
			workBook.write(fo);
		}catch(FileNotFoundException fnf){
			flag = -1;
			fnf.printStackTrace();
			
		}catch(IOException  io){
			flag = -1;
			io.printStackTrace();
		}finally{
			try{
				
				if(workBook!=null)workBook.close();
				if(fo!=null)fo.close();
				
			}catch(IOException  io){
				flag = -1;
				io.printStackTrace();
			}
		}
		
		return flag;
	}
}
