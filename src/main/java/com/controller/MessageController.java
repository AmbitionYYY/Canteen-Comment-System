package com.controller;

import com.bean.Message;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("Message")
@Controller
public class MessageController {

    @Autowired
    MessageService messageService;

//    进入反馈信息界面
    @RequestMapping("Message-feedback")
    public String messageFeedbackshow(){

        return "/WEB-INF/views/user/message/message-feedbackshow.jsp";
    }

//  反馈信息提交到此页面，跳转到反馈成功界面
    @RequestMapping("feedback-submit")
    public String messageFeedbackSubmit(Message message){
        Date date = new Date();
        //设置时间显示格式
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //将当前时间格式化为需要的类型
        String currentTime = sdf.format(date);
        message.setCreatetime(currentTime);
        messageService.addMessage(message);
        return "/WEB-INF/views/user/message/message-feedbackSuccess.jsp";
    }

    /**
     * @Description TODO
     * @Author JXY
     * @Date 8:29 2021/4/14
     * @param  :用户id
     * @return  用户反馈信息列表
     **/
    @ResponseBody
    @RequestMapping("viewMyMessage")
    public List<Message>  viewMyMessage(String username,Model model){
            System.out.println("拿到username的值："+username);
            List<Message> messageList = messageService.queryMessageByUsername(username);
            return messageList;
    }
}
