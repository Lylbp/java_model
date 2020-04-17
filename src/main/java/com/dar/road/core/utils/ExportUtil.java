package com.dar.road.core.utils;

import cn.hutool.core.util.ObjectUtil;
import com.dar.road.core.annotation.ExcelHead;
import com.dar.road.core.entity.Tuple;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * The type Export util.
 *
 * @author alex
 */
@Slf4j
public class ExportUtil {

    private static final short BORDER_PX = 1;

    /**
     * 导出excel表格
     *
     * @param head the head
     * @param body the body
     * @return workbook
     */
    public static Workbook expExcel(List<String> head, List<List<String>> body) {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Sheet1");
        Row row = sheet.createRow(0);
        CellStyle cellStyle = workbook.createCellStyle();
        setBorderStyle(cellStyle, BORDER_PX);
        cellStyle.setFont(setFontStyle(workbook, "黑体", (short) 14));
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        sheet.createFreezePane(0, 1, 0, 1);

        for (int i = 0; i < head.size(); i++) {
            Cell cell = row.createCell(i);
            cell.setCellValue(head.get(i));
            cell.setCellStyle(cellStyle);
        }

        CellStyle cellStyle2 = workbook.createCellStyle();
        setBorderStyle(cellStyle2, BORDER_PX);
        cellStyle2.setFont(setFontStyle(workbook, "宋体", (short) 12));
        cellStyle2.setAlignment(HorizontalAlignment.CENTER);
        for (int i = 0; i < body.size(); i++) {
            row = sheet.createRow(i + 1);
            List<String> paramList = body.get(i);
            for (int p = 0; p < paramList.size(); p++) {
                Cell cell = row.createCell(p);
                cell.setCellValue(paramList.get(p));
                cell.setCellStyle(cellStyle2);
            }
        }
        for (int i = 0, isize = head.size(); i < isize; i++) {
            sheet.autoSizeColumn(i);
        }
        return workbook;
    }

    /**
     * 文件输出
     *
     * @param workbook 填充好的workbook
     * @param path     存放的位置
     */
    public static void outFile(Workbook workbook, String path, HttpServletResponse response) {
        SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd-HH点mm分");
        int startIndex = path.indexOf('/') +1;
        path = path.substring(startIndex, path.lastIndexOf('.')) + date.format(new Date()) + path.substring(path.lastIndexOf('.'));

        try (OutputStream os = new BufferedOutputStream(response.getOutputStream())) {
            response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(path, "UTF-8"));
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            workbook.write(os);
        } catch (IOException e1) {
            log.error("out file error, path is {}", path, e1);
        }
    }

    /**
     * 设置字体样式
     *
     * @param workbook 工作簿
     * @param name     字体类型
     * @param height   字体大小
     * @return HSSFFont
     */
    private static Font setFontStyle(Workbook workbook, String name, short height) {
        Font font = workbook.createFont();
        font.setFontHeightInPoints(height);
        font.setFontName(name);
        return font;
    }

    /**
     * @param cellStyle
     * @param border
     */
    private static void setBorderStyle(CellStyle cellStyle, short border) {
//        cellStyle.setBorderBottom(border); // 下边框
//        cellStyle.setBorderLeft(border);// 左边框
//        cellStyle.setBorderTop(border);// 上边框
//        cellStyle.setBorderRight(border);// 右边框
    }


    /**
     * 导出excel表格 2007版本
     * 其中list 中的对象,必须是字段中加了{@link ExcelHead} 注解,并且只导出标准了注解的字段
     *
     * @param <T>      the type parameter
     * @param content  the content
     * @param addIndex the add index 是否把第一行设置为序号并自增
     * @return workbook workbook
     */
    public static <T> Workbook expExcel(List<T> content, boolean addIndex) {
        Workbook workbook = new XSSFWorkbook();
        if (ObjectUtil.isEmpty(content)) {
            return workbook;
        }
        T t = content.get(0);
        Field[] declaredFields = t.getClass().getDeclaredFields();

        List<Tuple<Field, ExcelHead>> headList = new ArrayList<>();
        for (val field : declaredFields) {
            ExcelHead annotation = field.getAnnotation(ExcelHead.class);
            if (annotation == null) {
                continue;
            }
            headList.add(new Tuple<>(field, annotation));
        }

        writeHead(headList, workbook, addIndex);

        try {
            writeBody(headList, workbook, addIndex, content);
        } catch (IllegalAccessException e) {
            log.error("get cell value error,", e);
        }
        int columnSize = addIndex ? headList.size() + 1 : headList.size();
        Sheet sheet = workbook.getSheetAt(0);
        for (int i = 0; i < columnSize; i++) {
            sheet.autoSizeColumn(i);
        }
        return workbook;
    }

    private static <T> void writeBody(List<Tuple<Field, ExcelHead>> headList, Workbook workbook, boolean addIndex,
                                      List<T> content) throws IllegalAccessException {

        CellStyle cellStyle2 = workbook.createCellStyle();
        setBorderStyle(cellStyle2, BORDER_PX);
        cellStyle2.setFont(setFontStyle(workbook, "宋体", (short) 12));
        cellStyle2.setAlignment(HorizontalAlignment.CENTER);
        int currentRow = 1;
        for (val vo : content) {
            Sheet sheetAt = workbook.getSheetAt(0);
            Row row = sheetAt.createRow(currentRow);
            for (Tuple<Field, ExcelHead> tuple : headList) {
                Field f = tuple.getT1();
                f.setAccessible(true);
                Object value = f.get(vo);
                String cellValue = CellUtil.getValueForInputCell(value);
                Cell cell = row.createCell(tuple.getT2().index());
                cell.setCellValue(cellValue);
                cell.setCellStyle(cellStyle2);
            }

            if (addIndex) {
                Cell cell = row.createCell(0);
                cell.setCellStyle(cellStyle2);
                cell.setCellValue(currentRow);
            }
            currentRow++;
        }

    }


    private static void writeHead(List<Tuple<Field, ExcelHead>> headList, Workbook workbook, boolean addIndex) {
        Sheet sheet = workbook.createSheet("sheet1");
        Row row = sheet.createRow(0);
        CellStyle cellStyle = workbook.createCellStyle();
        cellStyle.setFont(setFontStyle(workbook, "黑体", (short) 14));
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        sheet.createFreezePane(0, 1, 0, 1);

        if (addIndex) {
            Cell cell = row.createCell(0);
            cell.setCellValue("序号");
            cell.setCellStyle(cellStyle);
        }

        headList.forEach(t -> {
            ExcelHead ex = t.getT2();
            Cell cell = row.createCell(ex.index());
            cell.setCellValue(ex.value());
            cell.setCellStyle(cellStyle);
        });
    }
}
