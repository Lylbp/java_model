package com.dar.road.core.utils;


import com.dar.road.core.exception.ResResultException;
import com.dar.road.enums.ResResultEnum;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.springframework.util.StringUtils;
import java.math.BigDecimal;

public class CellUtil {
    /**
     * Gets cell value as string.
     *
     * @param cell the cell
     * @return the cell value as string
     */
    private static String getCellValueAsString(Cell cell) {
        if (cell == null) {
            return "";
        }
        CellType cellType = cell.getCellType();
        if (cellType.equals(CellType.STRING)) {
            return cell.getStringCellValue();
        }
        if (cellType.equals(CellType.BLANK)) {
            return "";
        } else if (cellType.equals(CellType.NUMERIC)) {
            String v =  String.valueOf(cell.getNumericCellValue());
            BigDecimal bigDecimal = new BigDecimal(v);
            return bigDecimal.stripTrailingZeros().toPlainString();
        } else if (cellType.equals(CellType.FORMULA)) {
            cell.getCellFormula();
        } else {
            return "";
        }
        return "";
    }

    public static String getCellValueWithException(Cell cell) {
        String cellValueAsString = getCellValueAsString(cell);
        if (StringUtils.isEmpty(cellValueAsString)) {
            throw new ResResultException(ResResultEnum.DATA_NOT_EXIST);
        }

        return cellValueAsString;
    }

    public static int getCellIntValueWithException(Cell cell) {
        CellType type = cell.getCellType();
        if (type == CellType.NUMERIC) {
            return (int) cell.getNumericCellValue();
        }else if (type == CellType.STRING){
            String v = cell.getStringCellValue();
            return Integer.parseInt(v);
        }
        throw new ResResultException(ResResultEnum.DATA_NOT_EXIST);
    }

    public static <T> String getValueForInputCell(T t) {
        if (t == null){
            return "";
        }
        if (t instanceof BigDecimal){
            return ((BigDecimal)t).toPlainString();
        }

        return t.toString();
    }
}
