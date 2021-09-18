package com.lylbp.common.utils;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.lylbp.common.enums.ResResultEnum;
import com.lylbp.common.exception.ResResultException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 高德地图api工具
 */
@Slf4j
@Component
public class AMapUtils {
    private static String GEO_URL = "https://restapi.amap.com/v3/geocode/geo";
    private static String REGEO_URL = "https://restapi.amap.com/v3/geocode/regeo";
    private static String KEY_STR = "2827f349d589423decf94590f7a48df4";

//    @Value("${GECODE_KEY}")
//    public void setKeyStr(String keyStr) {
//        AMapUtils.KEY_STR = keyStr;
//    }

    /**
     * 记录REG_COUNT
     */
    private static Integer REG_COUNT = 0;
    /**
     * 记录GEO_COUNT
     */
    private static Integer GEO_COUNT = 0;
    /**
     * 最大允许重复次数
     */
    private static Integer ALLOW_MAX = 2;


    /**
     * 通过地址获取经维度
     *
     * @param address 地址
     * @return JSONObject
     */
    public static JSONObject geo(String address) {
        String key = getKey();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("key", key);
        paramMap.put("output", "JSON");
        paramMap.put("address", address);


        String resultJsonStr = HttpUtil.get(GEO_URL, paramMap);
        JSONObject jsonObject = null;
        try {
            if (GEO_COUNT < ALLOW_MAX) {
                jsonObject = checkResultJson(resultJsonStr);
                if (jsonObject == null) {
                    throw new ResResultException(ResResultEnum.SYSTEM_ERR);
                }
            }
            GEO_COUNT = 0;
            if (jsonObject == null || !jsonObject.containsKey("geocodes")) {
                throw new ResResultException(ResResultEnum.SYSTEM_ERR);
            }

            JSONArray geocodes = jsonObject.getJSONArray("geocodes");
            Object geocodesObj = geocodes.getObj(0);

            return (JSONObject) geocodesObj;
        } catch (ResResultException resResultException) {
            ++GEO_COUNT;
            return geo(address);
        } catch (Exception exception) {
            log.error(exception.getMessage());
            return null;
        }
    }

    /**
     * 通过经维度获取地址
     *
     * @param location 经维度
     * @return JSONObject
     */
    public static JSONObject reGeo(String location) {
        String key = getKey();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("key", key);
        paramMap.put("output", "JSON");
        paramMap.put("location", location);

        String resultJsonStr = HttpUtil.get(REGEO_URL, paramMap);
        JSONObject jsonObject = null;

        try {
            if (REG_COUNT < ALLOW_MAX) {
                jsonObject = checkResultJson(resultJsonStr);
                if (jsonObject == null) {
                    throw new ResResultException(ResResultEnum.SYSTEM_ERR);
                }
            }

            REG_COUNT = 0;
            if (jsonObject == null || !jsonObject.containsKey("regeocode")) {
                return null;
            }

            Object object = jsonObject.get("regeocode");

            return (JSONObject) object;
        } catch (ResResultException resResultException) {
            ++REG_COUNT;
            return reGeo(location);
        } catch (Exception exception) {
            log.error(exception.getMessage());
            return null;
        }
    }

    /**
     * 通过地址获取经维度
     *
     * @param address 地址
     * @return JSONObject
     */
    public static String[] addressToLocation(String address) {
        JSONObject geo = geo(address);
        if (ObjectUtil.isEmpty(geo) || geo.get("location").toString().equals("[]")) {
            return null;
        }
        String location = (String) geo.get("location");
        return location.split(",");
    }

    /**
     * 通过经维度获取地址
     *
     * @param location 经维度
     * @return JSONObject
     */
    public static String locationToAddress(String location) {
        JSONObject reGod = reGeo(location);
        if (ObjectUtil.isEmpty(reGod)) {
            return null;
        }
        return (String) reGod.get("formatted_address");
    }


    private static JSONObject checkResultJson(String resultJsonStr) {
        JSONObject jsonObject = JSONUtil.parseObj(resultJsonStr);
        if (!jsonObject.containsKey("status")) {
            return null;
        }

        int status = Integer.parseInt((String) jsonObject.get("status"));
        if (status == 0) {
            return null;
        }

        return jsonObject;
    }

    private static String getKey() {
        List<String> keyList = Arrays.asList(KEY_STR.split(","));
        return keyList.get((int) RandomUtil.randomLong(0, keyList.size()));
//        return "2827f349d589423decf94590f7a48df4";
    }

}
