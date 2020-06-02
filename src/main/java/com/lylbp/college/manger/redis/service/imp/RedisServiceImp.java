package com.lylbp.college.manger.redis.service.imp;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.lylbp.college.manger.redis.BasePrefix;
import com.lylbp.college.manger.redis.config.RedisConfig;
import com.lylbp.college.manger.redis.service.RedisService;
import lombok.Data;
import org.springframework.stereotype.Service;
import redis.clients.jedis.*;
import redis.clients.jedis.params.GeoRadiusParam;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author weiwenbin
 * @Date 2020-03-25 09:51
 */
@Data
@Service
public class RedisServiceImp implements RedisService {
    @Resource
    JedisPool jedisPool;

    protected RedisConfig redisConfig;

    /**
     * 获取前缀
     *
     * @param prefix
     * @param key
     * @return
     */
    @Override
    public String getRealKeyPrefix(BasePrefix prefix, String key) {
        return prefix.getPrefix() + key;
    }

    /**
     * 获取前缀
     *
     * @param prefix
     * @param key
     * @return
     */
    @Override
    public String getRealKeyPrefix(String prefix, String key) {
        return prefix + key;
    }

    /**
     * 链接
     *
     * @return
     */
    @Override
    public Jedis getResource() {
        return jedisPool.getResource();
    }

    ////////////////////////////////////针对key的操作////////////////////////////////////////////////////////////////////

    /**
     * 设置key过期时间
     *
     * @param key
     * @param seconds
     * @return
     */
    @Override
    public boolean setKeyExpire(String prefix, String key, int seconds) {
        Jedis jedis = getResource();
        String realKey = getRealKeyPrefix(prefix, key);
        try {
            jedis.expire(realKey, seconds);
            return true;
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * key模糊查询
     */
    @Override
    public Set<String> keys(String prefix, String pattern) {
        Jedis jedis = getResource();
        String realKey = getRealKeyPrefix(prefix, pattern);
        try {
            return jedis.keys(realKey);
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 删除key
     *
     * @param key
     * @return
     */
    @Override
    public boolean del(String prefix, String key) {
        Jedis jedis = getResource();
        String realKey = getRealKeyPrefix(prefix, key);
        try {
            jedis.del(realKey);
            return true;
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 判断某一key是否存在
     *
     * @param prefix
     * @param key
     * @return
     */
    @Override
    public boolean exists(BasePrefix prefix, String key) {
        Jedis jedis = getResource();
        try {
            return jedis.exists(getRealKeyPrefix(prefix, key));
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 判断某一key是否存在
     *
     * @param prefix
     * @param key
     * @return
     */
    @Override
    public boolean exists(String prefix, String key) {
        Jedis jedis = getResource();
        try {
            return jedis.exists(getRealKeyPrefix(prefix, key));
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 清空所有的key
     *
     * @return
     */
    @Override
    public String flushAll() {
        Jedis jedis = getResource();
        try {
            return jedis.flushAll();
        } finally {
            returnToPool(jedis);
        }
    }
    ////////////////////////////////////对string操作////////////////////////////////////////////////////////////////////

    /**
     * 获取键为key对应的value
     *
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    @Override
    public <T> T get(BasePrefix prefix, String key, Class<T> clazz) {
        Jedis jedis = getResource();
        try {
            String str = jedis.get(getRealKeyPrefix(prefix, key));
            return stringToBean(str, clazz);
        } finally {
            returnToPool(jedis);
        }
    }


    /**
     * 设置值
     *
     * @param prefix
     * @param key
     * @param jsonStr
     * @return
     */
    @Override
    public boolean set(BasePrefix prefix, String key, String jsonStr) {
        Jedis jedis = getResource();
        try {
            if (ObjectUtil.isNotEmpty(jsonStr)) {
                String realKey = getRealKeyPrefix(prefix, key);
                int seconds = prefix.getExpireSeconds();
                jedis.set(realKey, jsonStr);
                if (seconds > 0) {
                    jedis.expire(realKey, seconds);
                }

                return true;
            }

            return false;
        } finally {
            returnToPool(jedis);
        }
    }
    ////////////////////////////////对List操作////////////////////////////////////////////////////////////////////
    ////////////////////////////////////对Set操作////////////////////////////////////////////////////////////////////

    /**
     * 将元素加入到set集合key中,已经有的忽略
     *
     * @param key
     * @param jsonStr
     * @return
     */
    @Override
    public boolean sadd(String key, String jsonStr) {
        Jedis jedis = getResource();
        try {
            if (ObjectUtil.isNotEmpty(jsonStr)) {
                jedis.sadd(key, jsonStr);
                return true;
            }

            return false;
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 返回Set集合中的所有成员
     *
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    @Override
    public <T> Set<T> smembers(String key, Class<T> clazz) {
        Jedis jedis = getResource();
        try {
            Set<String> valueJson = jedis.smembers(key);
            Set<T> beanSet = new HashSet<>(valueJson.size());
            valueJson.forEach(str -> beanSet.add(stringToBean(str, clazz)));

            return beanSet;
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 删除Set集合key中值为val的元素
     *
     * @param key
     * @param jsonStr
     * @return
     */
    @Override
    public Boolean srem(String key, String jsonStr) {
        Jedis jedis = getResource();
        try {
            jedis.srem(key, jsonStr);
            return true;
        } finally {
            returnToPool(jedis);
        }
    }


    ////////////////////////////////////对hash操作////////////////////////////////////////////////////////////////////

    /**
     * 往ZSet插入一个元素
     *
     * @param prefix
     * @param key
     * @param field
     * @param jsonStr
     * @return
     */
    @Override
    public boolean hset(BasePrefix prefix, String key, String field, String jsonStr) {
        Jedis jedis = getResource();
        try {
            if (ObjectUtil.isNotEmpty(jsonStr)) {
                String realKey = getRealKeyPrefix(prefix, key);
                int seconds = prefix.getExpireSeconds();
                jedis.hset(realKey, field, jsonStr);
                if (seconds > 0) {
                    jedis.expire(realKey, seconds);
                }

                return true;
            }

            return false;
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 获取哈希表key中给定域field的值
     *
     * @param prefix
     * @param key
     * @param field
     * @param clazz
     * @param <T>
     * @return
     */
    @Override
    public <T> T hget(BasePrefix prefix, String key, String field, Class<T> clazz) {
        Jedis jedis = getResource();
        String realKey = getRealKeyPrefix(prefix, key);
        try {
            String str = jedis.hget(realKey, field);
            return stringToBean(str, clazz);
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 设置map
     *
     * @param prefix
     * @param key
     * @param value
     * @return
     */
    @Override
    public Boolean hmset(BasePrefix prefix, String key, Map<String, String> value) {
        Jedis jedis = getResource();
        String realKey = getRealKeyPrefix(prefix, key);
        int seconds = prefix.getExpireSeconds();
        jedis.hmset(realKey, value);
        if (seconds > 0) {
            jedis.expire(realKey, seconds);
        }

        return true;
    }

    /**
     * 返回哈希表key中所有域和值
     *
     * @param prefix
     * @param key
     * @return
     */
    @Override
    public Map<String, String> hgetAll(BasePrefix prefix, String key) {
        Jedis jedis = getResource();
        String realKey = getRealKeyPrefix(prefix, key);
        return jedis.hgetAll(realKey);
    }

    ////////////////////////////对整数和浮点数操作//////////////////////////////////////////////////////////////////

    /**
     * 将key对应的value 加1
     *
     * @param prefix
     * @param key
     * @return
     */
    @Override
    public Long incr(BasePrefix prefix, String key) {
        Jedis jedis = getResource();
        try {
            return jedis.incr(getRealKeyPrefix(prefix, key));
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 将key对应的value 减1
     *
     * @param prefix
     * @param key
     * @return
     */
    @Override
    public Long decr(BasePrefix prefix, String key) {
        Jedis jedis = getResource();
        try {
            return jedis.decr(getRealKeyPrefix(prefix, key));
        } finally {
            returnToPool(jedis);
        }
    }

    ////////////////////////////对地理坐标操作//////////////////////////////////////////////////////////////////

    /**
     * 添加地理位置的坐标
     *
     * @param key        redis key
     * @param coordinate 坐标对象
     * @param member     坐标名称
     * @return
     */
    @Override
    public Long geoAdd(String key, GeoCoordinate coordinate, String member) {
        Jedis jedis = getResource();
        try {
            return jedis.geoadd(key, coordinate.getLongitude(), coordinate.getLatitude(), member);
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 批量添加地理位置
     *
     * @param key
     * @param coordinateMap
     * @return
     */
    @Override
    public Long geoAdd(String key, Map<String, GeoCoordinate> coordinateMap) {
        Jedis jedis = getResource();
        try {
            return jedis.geoadd(key, coordinateMap);
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 根据给定的坐标查询指定范围内的地理位置集合（返回匹配位置的经纬度 + 匹配位置与给定位置的距离 + 从近到远排序）
     *
     * @param key
     * @param coordinate
     * @param radius     距离，单位KM
     * @return
     */
    @Override
    public List<GeoRadiusResponse> geoRadius(String key, GeoCoordinate coordinate, double radius) {
        Jedis jedis = getResource();
        try {
            return jedis.georadius(key, coordinate.getLongitude(), coordinate.getLatitude(),
                    radius, GeoUnit.KM, GeoRadiusParam.geoRadiusParam().sortAscending().withCoord().withDist());
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 根据坐标点的名称，查询指定范围内的坐标位置集合（返回匹配位置的经纬度 + 匹配位置与给定位置的距离 + 从近到远排序）
     *
     * @param key
     * @param member
     * @param radius 距离，单位KM
     * @return
     */
    @Override
    public List<GeoRadiusResponse> geoRadiusByMember(String key, String member, double radius) {
        Jedis jedis = getResource();
        try {
            return jedis.georadiusByMember(key, member, radius, GeoUnit.KM, GeoRadiusParam.geoRadiusParam().sortAscending().withCoord().withDist());
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 查询两点位置的距离
     *
     * @param key
     * @param member1
     * @param member2
     * @param unit
     * @return
     */
    @Override
    public Double geoDist(String key, String member1, String member2, GeoUnit unit) {
        Jedis jedis = getResource();
        try {
            return jedis.geodist(key, member1, member2, unit);
        } finally {
            returnToPool(jedis);
        }
    }

    /**
     * 查询地理位置的坐标
     *
     * @param key
     * @param members
     * @return
     */
    @Override
    public List<GeoCoordinate> geoPos(String key, String... members) {
        Jedis jedis = getResource();
        try {
            return jedis.geopos(key, members);
        } finally {
            returnToPool(jedis);
        }
    }

    @SuppressWarnings("unchecked")
    private static <T> T stringToBean(String str, Class<T> clazz) {
        if (str == null || str.length() <= 0 || clazz == null) {
            return null;
        }
        if (clazz == int.class || clazz == Integer.class) {
            return (T) Integer.valueOf(str);
        } else if (clazz == String.class) {
            return (T) str;
        } else if (clazz == long.class || clazz == Long.class) {
            return (T) Long.valueOf(str);
        } else if (clazz == List.class) {
            return (T) JSONUtil.parseArray(str);
        } else {
            return JSON.toJavaObject(JSON.parseObject(str), clazz);
        }
    }

    private static <T> String beanToString(T value) {
        if (value == null) {
            return null;
        }
        Class<?> clazz = value.getClass();
        if (clazz == int.class || clazz == Integer.class) {
            return "" + value;
        } else if (clazz == String.class) {
            return (String) value;
        } else if (clazz == long.class || clazz == Long.class) {
            return "" + value;
        } else {
            return JSON.toJSONString(value);
        }
    }

    private void returnToPool(Jedis jedis) {
        if (jedis != null) {
            jedis.close();
        }
    }
}
