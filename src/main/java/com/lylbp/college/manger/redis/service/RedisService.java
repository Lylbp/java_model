package com.lylbp.college.manger.redis.service;

import com.lylbp.college.manger.redis.BasePrefix;
import com.lylbp.college.manger.redis.config.RedisConfig;
import redis.clients.jedis.GeoCoordinate;
import redis.clients.jedis.GeoRadiusResponse;
import redis.clients.jedis.GeoUnit;
import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author weiwenbin
 * redis基础调用 如果没有你需要的自己加
 * @Date 2020-03-25 09:50
 */
public interface RedisService {
    /**
     * 设置Config
     *
     * @param redisConfig
     */
    void setRedisConfig(RedisConfig redisConfig);

    /**
     * 获取前缀
     *
     * @param prefix
     * @param key
     * @return
     */
    String getRealKeyPrefix(BasePrefix prefix, String key);

    /**
     * 获取前缀
     * @param prefix
     * @param key
     * @return
     */
    String getRealKeyPrefix(String prefix, String key);

    /**
     * 链接
     *
     * @return
     */
    Jedis getResource();

    ////////////////////////////////////针对key的操作////////////////////////////////////////////////////////////////////

    /**
     * 设置key过期时间
     *
     * @param key
     * @param seconds
     * @return
     */
    boolean setKeyExpire(String prefix, String key, int seconds);

    /**
     * key模糊查询
     */
    Set<String> keys(String prefix, String pattern);

    /**
     * 删除key
     *
     * @param key
     * @return
     */
    boolean del(String prefix, String key);
    /**
     * 判断某一key是否存在
     *
     * @param prefix
     * @param key
     * @return
     */
    boolean exists(BasePrefix prefix, String key);

    /**
     * 判断某一key是否存在
     *
     * @param prefix
     * @param key
     * @return
     */
    boolean exists(String prefix, String key);

    /**
     * 删除所有key
     *
     * @return
     */
    String flushAll();
    ////////////////////////////////////对string操作////////////////////////////////////////////////////////////////////

    /**
     * 获取键为key对应的value
     *
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    <T> T get(BasePrefix prefix, String key, Class<T> clazz);


    /**
     * 设置值
     *
     * @param prefix
     * @param key
     * @param jsonStr
     * @return
     */
    boolean set(BasePrefix prefix, String key, String jsonStr);
    ////////////////////////////////对List操作////////////////////////////////////////////////////////////////////
    ////////////////////////////////////对Set操作////////////////////////////////////////////////////////////////////

    /**
     * 将元素加入到set集合key中,已经有的忽略
     *
     * @param key
     * @param jsonStr
     * @return
     */
    boolean sadd(String key, String jsonStr);

    /**
     * 返回Set集合中的所有成员
     *
     * @param key
     * @param clazz
     * @param <T>
     * @return
     */
    <T> Set<T> smembers(String key, Class<T> clazz);

    /**
     * 删除Set集合key中值为val的元素
     *
     * @param key
     * @param jsonStr
     * @return
     */
    Boolean srem(String key, String jsonStr);
    ////////////////////////////////////对ZSet操作////////////////////////////////////////////////////////////////////

    /**
     * 往ZSet插入一个元素
     *
     * @param prefix
     * @param key
     * @param field
     * @param jsonStr
     * @return
     */
    boolean hset(BasePrefix prefix, String key, String field, String jsonStr);

    ////////////////////////////////////对hash操作////////////////////////////////////////////////////////////////////

    /**
     * 获取Hash的元素
     *
     * @param prefix
     * @param key
     * @param field
     * @param clazz
     * @param <T>
     * @return
     */
    <T> T hget(BasePrefix prefix, String key, String field, Class<T> clazz);

    /**
     * 设置map
     * @param prefix
     * @param key
     * @param value
     * @return
     */
    Boolean hmset(BasePrefix prefix, String key, Map<String, String> value);

    /**
     * 返回哈希表key中所有域和值
     * @param prefix
     * @param key
     * @return
     */
    Map<String, String> hgetAll(BasePrefix prefix, String key);
    ////////////////////////////对整数和浮点数操作//////////////////////////////////////////////////////////////////

    /**
     * 将key对应的value 加1
     *
     * @param prefix
     * @param key
     * @return
     */
    Long incr(BasePrefix prefix, String key);

    /**
     * 将key对应的value 减1
     *
     * @param prefix
     * @param key
     * @return
     */
    Long decr(BasePrefix prefix, String key);

    ////////////////////////////对地理坐标操作//////////////////////////////////////////////////////////////////

    /**
     * 添加地理位置的坐标
     *
     * @param key        redis key
     * @param coordinate 坐标对象
     * @param member     坐标名称
     * @return
     */
    Long geoAdd(String key, GeoCoordinate coordinate, String member);

    /**
     * 批量添加地理位置
     *
     * @param key
     * @param coordinateMap
     * @return
     */
    Long geoAdd(String key, Map<String, GeoCoordinate> coordinateMap);

    /**
     * 根据给定的坐标查询指定范围内的地理位置集合（返回匹配位置的经纬度 + 匹配位置与给定位置的距离 + 从近到远排序）
     *
     * @param key
     * @param coordinate
     * @param radius     距离，单位KM
     * @return
     */
    List<GeoRadiusResponse> geoRadius(String key, GeoCoordinate coordinate, double radius);

    /**
     * 根据坐标点的名称，查询指定范围内的坐标位置集合（返回匹配位置的经纬度 + 匹配位置与给定位置的距离 + 从近到远排序）
     *
     * @param key
     * @param member
     * @param radius 距离，单位KM
     * @return
     */
    List<GeoRadiusResponse> geoRadiusByMember(String key, String member, double radius);

    /**
     * 查询两点位置的距离
     *
     * @param key
     * @param member1
     * @param member2
     * @param unit
     * @return
     */
    Double geoDist(String key, String member1, String member2, GeoUnit unit);

    /**
     * 查询地理位置的坐标
     *
     * @param key
     * @param members
     * @return
     */
    List<GeoCoordinate> geoPos(String key, String... members);
}
