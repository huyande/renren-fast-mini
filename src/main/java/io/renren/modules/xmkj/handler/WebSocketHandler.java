package io.renren.modules.xmkj.handler;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.common.utils.PostgreSqlJdbcConn;
import io.renren.common.utils.SpringContextUtils;
import io.renren.modules.job.service.ScheduleJobLogService;
import io.renren.modules.sys.service.SysLogService;
import io.renren.modules.xmkj.entity.WechatNumbersEntity;
import io.renren.modules.xmkj.service.WechatNumbersService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.ConcurrentHashMap;

@ServerEndpoint(value ="/goLink/{source}/{phone}") // 通过这个 spring boot 就可以知道你暴露出去的 ws 应用的路径，有点类似我们经常用的@RequestMapping。比如你的启动端口是8080，而这个注解的值是ws，那我们就可以通过 ws://127.0.0.1:8080/ws 来连接你的应用
@Component
@Slf4j
public class WebSocketHandler {
    /**
     * 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
     */
    private static int onlineCount = 0;
    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
     */
    private static ConcurrentHashMap<String, WebSocketHandler> webSocketMap = new ConcurrentHashMap<>();
    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;
    /**
     * 接收phone
     */
    private String phone = "";
    /**
     * 连接来源 【对话助手】【自动化运营助手】
     */
    private String source = "";

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("source") String source, @PathParam("phone") String phone) {
        this.session = session;
        this.phone = phone;
        this.source = source;
        if(source==null||phone==null){
            log.error("无source或phone");
        }else {
            if(source.equals("yyzs")){//自动化运营助手
                PostgreSqlJdbcConn postgreSqlJdbcConn = SpringContextUtils.<PostgreSqlJdbcConn>getBean("postgreSqlJdbcConn", PostgreSqlJdbcConn.class);
                Connection connection = postgreSqlJdbcConn.getConnection();
                String sql ="select id,phone from wechat_numbers where phone=?";
                try {
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1,phone);
                    ResultSet rs = preparedStatement.executeQuery();
                    if(!rs.next()){
                        JSONObject json = new JSONObject();
                        json.put("event","open");
                        json.put("msg","账户不存在");
                        sendMessage(json.toJSONString());
                        serverClose();
                        return;
                    }
                    //关闭数据库连接
                    postgreSqlJdbcConn.close(connection,preparedStatement,rs);
                } catch (SQLException e) {
                    log.error("查询异常"+e.getMessage() );
                } catch (IOException e){
                    log.error("用户:" + phone + ",网络异常!!!!!! "+source);
                }
            }else if(source.equals("dhzs")){//对话助手
                try {
                    JSONObject json = new JSONObject();
                    json.put("event","open");
                    json.put("msg","暂不支持");
                    sendMessage(json.toJSONString());
                    serverClose();
                    return;
                } catch (IOException e) {
                    log.error("用户:" + phone + ",网络异常!!!!!! "+source);
                }
            }else {
                try {
                    JSONObject json = new JSONObject();
                    json.put("event","open");
                    json.put("msg","请检查连接地址");
                    sendMessage(json.toJSONString());
                    serverClose();
                    return;
                } catch (IOException e) {
                    log.error("用户:" + phone + ",网络异常!!!!!! "+source);
                }
            }
            //连接
            if (webSocketMap.containsKey(phone)) {
                webSocketMap.remove(phone);
                //加入set中
                webSocketMap.put(phone, this);
            } else {
                //加入set中
                webSocketMap.put(phone, this);
                //在线数加1
                addOnlineCount();
            }

            log.info("用户连接:" + phone + ",当前在线人数为:" + getOnlineCount());

            try {
                JSONObject json = new JSONObject();
                json.put("event","open");
                json.put("msg","ok");
                sendMessage(json.toJSONString());
            } catch (IOException e) {
                log.error("用户:" + phone + ",网络异常!!!!!!");
            }
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        if (webSocketMap.containsKey(phone)) {
            webSocketMap.remove(phone);
            //从set中删除
            subOnlineCount();
        }
        log.info("用户退出:" + phone + ",当前在线人数为:" + getOnlineCount());
    }

    /**
     * 主动断开连接
     */
    public void serverClose(){
        try {
            this.session.close();
            this.onClose();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("用户消息:" + phone + ",报文:" + message);
        //可以群发消息
        //消息保存到数据库、redis
        /*if (StringUtils.isNotBlank(message)) {
            try {
                //解析发送的报文
                JSONObject jsonObject = JSON.parseObject(message);
                //追加发送人(防止串改)
                jsonObject.put("fromphone", this.phone);
                String tophone = jsonObject.getString("tophone");
                //传送给对应tophone用户的websocket
                if (StringUtils.isNotBlank(tophone) && webSocketMap.containsKey(tophone)) {
                    webSocketMap.get(tophone).sendMessage(jsonObject.toJSONString());
                } else {
                    //否则不在这个服务器上，发送到mysql或者redis
                    log.error("请求的phone:" + tophone + "不在该服务器上");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }*/
    }

    /**
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("用户错误:" + this.phone + ",原因:" + error.getMessage());
        error.printStackTrace();
    }

    /**
     * 实现服务器主动推送
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }


    /**
     * 发送自定义消息
     */
    public static boolean sendInfo(String message, @PathParam("phone") String phone) throws IOException {
        log.info("发送消息到:" + phone + "，报文:" + message);
        boolean flag = false;
        if (StringUtils.isNotBlank(phone) && webSocketMap.containsKey(phone)) {
            webSocketMap.get(phone).sendMessage(message);
            return !flag;
        } else {
            log.error("用户" + phone + ",不在线！");
            return  flag;
        }
    }

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketHandler.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketHandler.onlineCount--;
    }
}



